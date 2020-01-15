class CocktailRecipe < ApplicationRecord 
    belongs_to :user, optional: true
    belongs_to :category, optional: true
    has_many :comments 
    has_many :cocktail_recipe_alcohol_types 
    has_many :alcohol_types, :through => :cocktail_recipe_alcohol_types 
    has_many :ingredients

    accepts_nested_attributes_for :ingredients

    #validates :title, :description, :directions, presence: true  

    def category_name=(name)
        self.category = Category.find_or_create_by(name: name)
      end
    
      def category_name
         self.category ? self.category.name : nil
      end

end
