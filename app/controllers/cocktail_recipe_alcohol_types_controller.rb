class CocktailRecipeAlcoholTypesController < ApplicationController 
    def new 
        @cocktail_recipe_alcohol_type = CocktailRecipeAlcoholType.new 
    end 

    def show 
        @cocktail_recipe_alcohol_type = CocktailRecipeAlcoholType.find(params[:id]) 
    end 
    
    def index 
        @cocktail_recipe_alcohol_types = CocktailRecipeAlcoholType.all 
    end 
end
