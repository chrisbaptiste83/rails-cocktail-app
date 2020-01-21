class AlcoholType < ApplicationRecord 
    has_many :cocktail_recipe_alcohol_types 
    has_many :cocktail_recipes, :through => :cocktail_recipe_alcohol_types 

end
