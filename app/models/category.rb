class Category < ApplicationRecord 
    has_many :cocktail_recipes 

    def self.search(search)
        where("name LIKE ?", "%#{search}%") 
    end
    
end
