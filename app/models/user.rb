class User < ApplicationRecord 
    has_many :cocktail_recipes 
    has_many :comments 
end
