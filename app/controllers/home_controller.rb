class HomeController < ApplicationController 
    def index 
        @recent_comments = Comment.includes(:user, :cocktail_recipe).order(created_at: :desc).limit(6)
        @spotlight = CocktailRecipe.includes(:category).order("RANDOM()").first
        @bartender_vibe = params[:vibe].presence
        @bartender_spirit = params[:spirit].to_s.strip.presence
        @bartender_picks = bartender_picks(@bartender_vibe, @bartender_spirit)
        @ai_bartender_reply = flash[:ai_bartender_reply]
        @ai_bartender_prompt = flash[:ai_bartender_prompt]
        @ai_bartender_strength = flash[:ai_bartender_strength]
        @ai_bartender_glass = flash[:ai_bartender_glass]
        @ai_bartender_history = load_ai_bartender_history
    end 

    private

    def bartender_picks(vibe, spirit)
        scope = CocktailRecipe.includes(:category, :user)
        needs_ingredients = vibe.present? || spirit.present?

        if needs_ingredients
          scope = scope.joins(:ingredients)
        end

        if spirit.present?
          scope = scope.where("lower(ingredients.name) LIKE ?", "%#{spirit.downcase}%")
        end

        if vibe.present?
          vibe_keywords = {
            "bright" => %w[citrus lemon lime orange grapefruit],
            "smoky" => %w[mezcal smoky smoked],
            "spirit-forward" => %w[whiskey bourbon rye gin vodka rum],
            "tropical" => %w[pineapple coconut mango],
            "bubbly" => %w[champagne prosecco soda sparkling]
          }

          keywords = vibe_keywords[vibe]
          if keywords.present?
            clause = keywords.map { "lower(ingredients.name) LIKE ?" }.join(" OR ")
            scope = scope.where(clause, *keywords.map { |k| "%#{k}%" })
          end
        end

        picks = scope.distinct.limit(3)
        picks = CocktailRecipe.order("RANDOM()").limit(3) if picks.blank?
        picks
    end

    def load_ai_bartender_history
      if user_signed_in?
        conversation = if session[:ai_conversation_id].present?
                         current_user.ai_conversations.includes(:ai_messages).find_by(id: session[:ai_conversation_id])
                       end
        conversation ||= current_user.ai_conversations.includes(:ai_messages).order(created_at: :desc).first

        return [] unless conversation

        session[:ai_conversation_id] ||= conversation.id
        conversation.recent_messages.map { |msg| { role: msg.role, content: msg.content } }
      else
        session[:ai_bartender_history] || []
      end
    end
end
