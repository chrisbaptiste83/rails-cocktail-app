class Comment < ApplicationRecord 
    belongs_to :cocktail_recipe 
    belongs_to :user 
end
