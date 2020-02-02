class Ingredient < ApplicationRecord 
    has_many :recipe_ingredients
    has_many :cocktail_recipes, through: :recipe_ingredients
    
    validates :name, presence: true
    validates :name, uniqueness: true 


    def self.search(search)
        where("name LIKE ?", "%#{search}%") 
      end
 

    end
