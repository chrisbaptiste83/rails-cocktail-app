class RecipeIngredient < ApplicationRecord 
    belongs_to :cocktail_recipe
    belongs_to :ingredient
end
