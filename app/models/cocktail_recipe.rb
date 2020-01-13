class CocktailRecipe < ApplicationRecord 
    belongs_to :user 
    belongs_to :category 
    has_many :comments 
    has_many :cocktail_recipe_alcohol_types 
    has_many :alcohol_types :through => :cocktail_recipe_alcohol_types
end
