class User < ApplicationRecord 
    has_many :cocktail_recipes 
    has_many :comments 
    validates :username, presence: true    
    validates :email, presence: true
    validates :password, length: { in: 8..15 } 
    has_secure_password
end
