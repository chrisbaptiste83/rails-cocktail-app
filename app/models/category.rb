class Category < ApplicationRecord
    has_many :cocktail_recipes

    validates :name, presence: true

    def self.search(search)
        where("name ILIKE ?", "%#{search}%")
    end
    
end
