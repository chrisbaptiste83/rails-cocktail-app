<<<<<<< HEAD
class Category < ApplicationRecord
    has_many :cocktail_recipes

    validates :name, presence: true
||||||| 23076d5
class Category < ApplicationRecord 
    has_many :cocktail_recipes 
=======
class Category < ApplicationRecord 
    has_many :cocktail_recipes, dependent: :nullify
    validates :name, presence: true, uniqueness: true
>>>>>>> gitlab/main

    def self.search(search)
<<<<<<< HEAD
        where("name ILIKE ?", "%#{search}%")
||||||| 23076d5
        where("name LIKE ?", "%#{search}%") 
=======
        where("name ILIKE ?", "%#{search}%") 
>>>>>>> gitlab/main
    end
    
end
