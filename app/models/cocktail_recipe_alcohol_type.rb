class CocktailRecipeAlcoholType < ApplicationRecord 
    belongs_to :cocktail_recipe 
    belongs_to :alcohol_type
end
