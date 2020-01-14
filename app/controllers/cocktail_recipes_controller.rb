class CocktailRecipesController < ApplicationController 
   
    def new 
        @cocktail_recipe = CocktailRecipe.new 
    end 

    def create
        @cocktail_recipe = CocktailRecipe.new(cocktail_recipe_params) 
        @cocktail_recipe.save
        redirect_to cocktail_recipe_path(@cocktail_recipe)
      end
    
      def show
        @cocktail_recipe = CocktailRecipe.find(params[:id])
      end 

    def index 
        @cocktail_recipes = CocktailRecipe.all  
    end 

      private

      def cocktail_recipe_params
        params.require(:cocktail_recipe).permit(:id, :user_id, :category_id, :title, :directions, :description)
      end
end
