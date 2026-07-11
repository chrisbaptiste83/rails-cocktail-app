class RecipeIngredient < ApplicationRecord
    belongs_to :cocktail_recipe
    belongs_to :ingredient

    validates :quantity, presence: true
    validates :ingredient_id, uniqueness: { scope: :cocktail_recipe_id }
end
