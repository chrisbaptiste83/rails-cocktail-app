class CocktailRecipesController < ApplicationController 
   
    def new 
        @cocktail_recipe = CocktailRecipe.new 
    end 

    def create
        @cocktail_recipe = CocktailRecipe.new(cocktail_recipe_params) 
        @coktail_recipe.save 
        redirect_to cocktail_recipe_path(@cocktail_recipe)
      end
    
      def show
        @cocktail_recipe = CocktailRecipe.find(params[:id])
      end 

    def index 
        @cocktail_recipes = CocktailRecipe.all  

      private

      def cocktail_recipe_params
        params.require(:cocktail_recipe).permit(:title, :directions, :description)
      end

end
end
