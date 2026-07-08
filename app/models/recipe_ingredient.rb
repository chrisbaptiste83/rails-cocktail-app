class RecipeIngredient < ApplicationRecord 
    belongs_to :cocktail_recipe
    belongs_to :ingredient
    validates :ingredient_id, uniqueness: { scope: :cocktail_recipe_id }
end
