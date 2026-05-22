class CocktailRecipeIndexQuery
    def initialize(params)
        @params = params
    end

    def call
        if @params[:search].present?
            CocktailRecipe.search(@params[:search]).order(created_at: :desc)
        elsif @params[:user].present?
            CocktailRecipe.by_user(@params[:user]).order(:title)
        elsif @params[:user_id].present?
            User.find(@params[:user_id]).cocktail_recipes.order(title: :asc)
        else
            CocktailRecipe.all.order(:title)
        end
    end
end
