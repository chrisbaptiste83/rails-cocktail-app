class CocktailRecipeAlcoholType < ApplicationRecord 
    belongs_to :cocktail_recipe 
    belongs_to :alcohol_type 

    def new 
        @cocktail_recipe_alcohol_type = CocktailRecipeAlcoholType.new 
    end 
     
end
