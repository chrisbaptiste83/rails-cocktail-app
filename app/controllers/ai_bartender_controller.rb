class AiBartenderController < ApplicationController
  include ActionController::Live

  before_action :load_conversation
  before_action :load_guest_history

  def create
    prompt = params[:prompt].to_s.strip
    strength = params[:strength].to_s.strip.presence
    glass = params[:glass].to_s.strip.presence

    if prompt.blank?
      flash[:ai_bartender_reply] = "Tell me your mood, spirit, or flavor notes so I can mix something worthy of the lounge."
      flash[:ai_bartender_prompt] = prompt
      flash[:ai_bartender_strength] = strength
      flash[:ai_bartender_glass] = glass
      return redirect_to root_path
    end

    history = prompt_history
    append_message("user", prompt)

    reply = AiBartender.call(
      prompt: prompt,
      strength: strength,
      glass: glass,
      history: history
    )

    append_message("assistant", reply)

    flash[:ai_bartender_reply] = reply
    flash[:ai_bartender_prompt] = prompt
    flash[:ai_bartender_strength] = strength
    flash[:ai_bartender_glass] = glass
    redirect_to root_path
  rescue StandardError => e
    flash[:ai_bartender_reply] = "The bartender is polishing glassware right now. Try again in a moment. (#{e.message})"
    flash[:ai_bartender_prompt] = prompt
    flash[:ai_bartender_strength] = strength
    flash[:ai_bartender_glass] = glass
    redirect_to root_path
  end

  def stream
    prompt = params[:prompt].to_s.strip
    strength = params[:strength].to_s.strip.presence
    glass = params[:glass].to_s.strip.presence

    response.headers["Content-Type"] = "text/event-stream"
    response.headers["Cache-Control"] = "no-cache"
    response.headers["X-Accel-Buffering"] = "no"

    if prompt.blank?
      response.stream.write("data: #{JSON.generate(error: "Prompt required")}\n\n")
      response.stream.write("event: done\ndata: {}\n\n")
      return
    end

    history = prompt_history
    append_message("user", prompt)

    full_text = +""
    AiBartender.stream(prompt: prompt, strength: strength, glass: glass, history: history) do |delta|
      full_text << delta
      response.stream.write("data: #{JSON.generate(delta: delta)}\n\n")
    end

    append_message("assistant", full_text)
    response.stream.write("event: done\ndata: {}\n\n")
  rescue StandardError => e
    response.stream.write("data: #{JSON.generate(error: e.message)}\n\n")
    response.stream.write("event: done\ndata: {}\n\n")
  ensure
    response.stream.close
  end

  def reset
    session.delete(:ai_bartender_history)
    if @conversation
      @conversation.ai_messages.delete_all
    end
    redirect_to root_path
  end

  private

  def load_conversation
    return unless user_signed_in?

    @conversation = current_user.ai_conversations.find_by(id: session[:ai_conversation_id])
    unless @conversation
      @conversation = current_user.ai_conversations.create!(title: "Lounge Chat")
      session[:ai_conversation_id] = @conversation.id
    end
  end

  def load_guest_history
    return if @conversation

    session[:ai_bartender_history] ||= []
  end

  def append_message(role, content)
    if @conversation
      @conversation.ai_messages.create!(role: role, content: content)
    else
      session[:ai_bartender_history] << { role: role, content: content }
      session[:ai_bartender_history] = session[:ai_bartender_history].last(6)
    end
  end

  def prompt_history
    if @conversation
      @conversation.recent_messages.map { |msg| { role: msg.role, content: msg.content } }
    else
      session[:ai_bartender_history] || []
    end
  end
end
