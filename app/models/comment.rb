class Comment < ApplicationRecord 
    belongs_to :cocktail_recipe 
    belongs_to :user 

    accepts_nested_attributes_for :user, reject_if: :all_blank

end
