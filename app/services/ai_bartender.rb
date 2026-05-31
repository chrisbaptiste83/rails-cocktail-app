require "net/http"
require "json"

class AiBartender
  class Error < StandardError; end

  OPENAI_URL = URI("https://api.openai.com/v1/responses").freeze
  HTTP_OPEN_TIMEOUT = 15
  HTTP_READ_TIMEOUT = 60

  def self.call(prompt:, strength:, glass:, history: [])
    api_key = ENV["OPENAI_API_KEY"].to_s.strip
    raise Error, "Missing OPENAI_API_KEY" if api_key.blank?

    model = ENV.fetch("OPENAI_BARTENDER_MODEL", "gpt-4.1")
    menu = build_house_menu

    system_prompt = <<~SYSTEM.strip
      You are a seasoned cocktail bartender. Respond with a concise, stylish recipe that feels like a real bar menu.
      Include: drink name, quick vibe line, ingredients with amounts, build method, glassware, garnish, and one short tip.
      Keep it under 140 words. Be specific, avoid generic phrasing.
    SYSTEM

    user_prompt = <<~USER.strip
      Guest notes: #{prompt}
      Preferred strength: #{strength || "dealer's choice"}
      Preferred glass: #{glass || "dealer's choice"}
      House list (optional inspiration):
      #{menu}
    USER

    messages = []
    messages << { role: "system", content: system_prompt }
    history.each do |message|
      next unless message.is_a?(Hash)
      role = message[:role].to_s
      content = message[:content].to_s
      next if role.blank? || content.blank?
      messages << { role: role, content: content }
    end
    messages << { role: "user", content: user_prompt }

    payload = {
      model: model,
      input: messages,
      temperature: 0.7,
      max_output_tokens: 300
    }

    response = Net::HTTP.start(OPENAI_URL.host, OPENAI_URL.port, use_ssl: true, open_timeout: HTTP_OPEN_TIMEOUT, read_timeout: HTTP_READ_TIMEOUT) do |http|
      request = Net::HTTP::Post.new(OPENAI_URL)
      request["Authorization"] = "Bearer #{api_key}"
      request["Content-Type"] = "application/json"
      request.body = JSON.generate(payload)
      http.request(request)
    end

    body = parse_json(response.body)
    if response.code.to_i >= 400
      message = body.dig("error", "message").presence || "OpenAI API error (HTTP #{response.code})"
      raise Error, message
    end

    extract_text(body).presence || "I couldn't craft a pour right now. Try a new vibe or spirit."
  end

  def self.stream(prompt:, strength:, glass:, history: [])
    api_key = ENV["OPENAI_API_KEY"].to_s.strip
    raise Error, "Missing OPENAI_API_KEY" if api_key.blank?

    model = ENV.fetch("OPENAI_BARTENDER_MODEL", "gpt-4.1")
    menu = build_house_menu

    system_prompt = <<~SYSTEM.strip
      You are a seasoned cocktail bartender. Respond with a concise, stylish recipe that feels like a real bar menu.
      Include: drink name, quick vibe line, ingredients with amounts, build method, glassware, garnish, and one short tip.
      Keep it under 140 words. Be specific, avoid generic phrasing.
    SYSTEM

    user_prompt = <<~USER.strip
      Guest notes: #{prompt}
      Preferred strength: #{strength || "dealer's choice"}
      Preferred glass: #{glass || "dealer's choice"}
      House list (optional inspiration):
      #{menu}
    USER

    messages = []
    messages << { role: "system", content: system_prompt }
    history.each do |message|
      next unless message.is_a?(Hash)
      role = message[:role].to_s
      content = message[:content].to_s
      next if role.blank? || content.blank?
      messages << { role: role, content: content }
    end
    messages << { role: "user", content: user_prompt }

    payload = {
      model: model,
      input: messages,
      temperature: 0.7,
      max_output_tokens: 300,
      stream: true
    }

    full_text = +""

    Net::HTTP.start(OPENAI_URL.host, OPENAI_URL.port, use_ssl: true, open_timeout: HTTP_OPEN_TIMEOUT, read_timeout: HTTP_READ_TIMEOUT) do |http|
      request = Net::HTTP::Post.new(OPENAI_URL)
      request["Authorization"] = "Bearer #{api_key}"
      request["Content-Type"] = "application/json"
      request.body = JSON.generate(payload)

      http.request(request) do |response|
        if response.code.to_i >= 400
          body = response.read_body
          error_message = extract_error_message(body)
          raise Error, error_message
        end

        buffer = +""
        response.read_body do |chunk|
          buffer << chunk
          while (line = buffer.slice!(/.*\n/))
            line.strip!
            next if line.empty?
            next unless line.start_with?("data:")

            data = line.delete_prefix("data:").strip
            next if data == "[DONE]"

            json = parse_json(data)
            next unless json

            delta = extract_delta(json)
            next if delta.blank?

            full_text << delta
            yield delta if block_given?
          end
        end
      end
    end

    full_text
  end

  def self.extract_text(body)
    return "" unless body.is_a?(Hash)

    outputs = body.fetch("output", [])
    texts = outputs.flat_map do |item|
      next [] unless item.is_a?(Hash)

      if item["type"] == "message"
        item.fetch("content", []).filter_map do |content|
          content["text"] if content.is_a?(Hash) && content["type"] == "output_text"
        end
      elsif item["type"] == "output_text"
        item["text"].to_s
      end
    end
    texts.join("\n").strip
  end

  def self.extract_delta(payload)
    return nil unless payload.is_a?(Hash)

    if payload["type"] == "response.output_text.delta"
      payload.dig("delta")
    else
      outputs = payload.fetch("output", [])
      outputs.each do |item|
        next unless item.is_a?(Hash) && item["type"] == "output_text"
        return item["text"]
      end
      nil
    end
  end

  def self.build_house_menu
    CocktailRecipe
      .includes(:category, :ingredients)
      .order("RANDOM()")
      .limit(5)
      .map do |recipe|
        ingredients = recipe.ingredients.limit(4).map(&:name).join(", ")
        "- #{recipe.title} (#{recipe.category&.name || "House"}) :: #{ingredients}"
      end
      .join("\n")
  end

  def self.parse_json(raw)
    JSON.parse(raw.to_s)
  rescue JSON::ParserError => e
    raise Error, "Invalid JSON from OpenAI: #{e.message}"
  end
  private_class_method :parse_json

  def self.extract_error_message(body)
    return "Unknown error from OpenAI" if body.nil? || body.empty?

    parsed = JSON.parse(body)
    parsed.dig("error", "message").presence || body.to_s
  rescue JSON::ParserError
    body.to_s
  end
  private_class_method :extract_error_message
end
