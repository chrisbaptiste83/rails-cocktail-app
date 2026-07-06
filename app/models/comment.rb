class Comment < ApplicationRecord 
    belongs_to :cocktail_recipe, :counter_cache => true  
    belongs_to :user

end
