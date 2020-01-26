class Ingredient < ApplicationRecord 
    has_many :recipe_ingredients
    has_many :cocktail_recipes, through: :recipe_ingredients
    
    validates :name, presence: true
    validates :name, uniqueness: true 

 
end
