class Category < ApplicationRecord 
    has_many :cocktail_recipes, dependent: :nullify

    def self.search(search)
        where("name ILIKE ?", "%#{search}%") 
    end
    
end
