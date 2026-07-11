class CocktailRecipeIndexQuery
    def initialize(params)
        @params = params
    end

    def call
        recipes = CocktailRecipe.includes(:category, :ingredients)

        if @params[:search].present?
            recipes.search(@params[:search]).order(created_at: :desc)
        elsif @params[:user].present?
            recipes.by_user(@params[:user]).order(:title)
        elsif @params[:user_id].present?
            User.find(@params[:user_id]).cocktail_recipes.includes(:category, :ingredients).order(title: :asc)
        else
            recipes.order(:title)
        end
    end
end
