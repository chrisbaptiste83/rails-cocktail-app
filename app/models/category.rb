class Category < ApplicationRecord 
    has_many :cocktail_recipes 

    def self.search(search)
        where("name ILIKE ?", "%#{search}%") 
    end
    
end
