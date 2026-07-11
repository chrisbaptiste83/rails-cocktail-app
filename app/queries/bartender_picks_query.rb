class BartenderPicksQuery
    VIBE_KEYWORDS = {
        "bright" => %w[citrus lemon lime orange grapefruit],
        "smoky" => %w[mezcal smoky smoked],
        "spirit-forward" => %w[whiskey bourbon rye gin vodka rum],
        "tropical" => %w[pineapple coconut mango],
        "bubbly" => %w[champagne prosecco soda sparkling]
    }.freeze

    def initialize(vibe, spirit)
        @vibe = vibe
        @spirit = spirit
    end

    def call
        scope = CocktailRecipe.includes(:category, :user)
        needs_ingredients = @vibe.present? || @spirit.present?

        scope = scope.joins(:ingredients) if needs_ingredients

        if @spirit.present?
            scope = scope.where("lower(ingredients.name) LIKE ?", "%#{@spirit.downcase}%")
        end

        if @vibe.present?
            keywords = VIBE_KEYWORDS[@vibe]
            if keywords.present?
                clause = keywords.map { "lower(ingredients.name) LIKE ?" }.join(" OR ")
                scope = scope.where(clause, *keywords.map { |k| "%#{k}%" })
            end
        end

        picks = scope.distinct.limit(3)
        picks = CocktailRecipe.order("RANDOM()").limit(3) if picks.blank?
        picks
    end
end
