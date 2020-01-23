class CocktailRecipe < ApplicationRecord 
    belongs_to :user, optional: true
    belongs_to :category, optional: true
    has_many :comments 
    has_many :cocktail_recipe_alcohol_types 
    has_many :alcohol_types, :through => :cocktail_recipe_alcohol_types 
    has_many :ingredients

    accepts_nested_attributes_for :ingredients, reject_if: :all_blank, allow_destroy: true 
    accepts_nested_attributes_for :cocktail_recipe_alcohol_types

    #validates :title, :description, :directions, presence: true  

    def category_name=(name)
        self.category = Category.find_or_create_by(name: name)
      end
    
      def category_name
         self.category ? self.category.name : nil
      end 

      def alcohol_types_attributes=(alcohol_types_attributes)
        alcohol_types_attributes.values.each do |alcohol_types_attribute|
          new_alcohol_type = AlcoholType.find_or_create_by(alcohol_types_attribute)
          self.alcohol_types << new_alcohol_type
        end 


      end

end
