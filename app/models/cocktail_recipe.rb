class CocktailRecipe < ApplicationRecord 
    belongs_to :user, optional: true
    belongs_to :category, optional: true
    has_many :comments 
    has_many :cocktail_recipe_alcohol_types 
    has_many :alcohol_types, :through => :cocktail_recipe_alcohol_types 

    validates :title, :description, :directions, presence: true

end
