class CocktailRecipe < ApplicationRecord 
    belongs_to :user
    belongs_to :category 
    has_many :comments 
    has_many :recipe_ingredients
    has_many :ingredients, through: :recipe_ingredients

    accepts_nested_attributes_for :recipe_ingredients, reject_if: lambda {|attributes| attributes['name'].blank?}
    accepts_nested_attributes_for :ingredients, reject_if: lambda {|attributes| attributes['name'].blank?}

    validates :title, :description, :directions, :category_name, presence: true  

    has_attached_file :avatar, :styles => { :medium => "200x200#"}

    validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/ 

    scope :most_comments, -> { order("comments_count DESC").first } 
    scope :five_latest_cocktail_recipes,  -> { order("created_at desc").limit(5)}
    scope :of_the_day,  -> { order('RANDOM()').first}

    def category_name=(name)
      self.category = Category.find_or_create_by(name: name)
   end
  
   def category_name
       self.category ? self.category.name : nil
   end 
    
    def self.by_user(user_id)
      where(user: user_id)
    end
     
    def self.search(search)
      where("title LIKE ?", "%#{search}%") 
    end

    def previous
        CocktailRecipe.all.order(:title).where("title < ?", title).last
    end
      

    def next
        CocktailRecipe.all.order(:title).where("title > ?", title).first
    end


    

    def delete_ingredients_from_recipe
        ingredients.size.times do
        ingredient = RecipeIngredient.find_by(cocktail_recipe_id: self.id)
        ingredient.delete
     end
    end 

    def add_ingredients_to_recipe(ingredients_params)
      delete_ingredients_from_recipe 

      ingredients_params[:recipe_ingredients_attributes].each do |k, recipe_ingredient|
        if recipe_ingredient[:ingredient][:name].present?
          ingredient_name = recipe_ingredient[:ingredient][:name]
          ingredient = Ingredient.find_or_create_by(name: ingredient_name)
        elsif recipe_ingredient[:ingredient_id].present?
          ingredient = Ingredient.find_by(id: recipe_ingredient[:ingredient_id]) 
        end
        if recipe_ingredient[:quantity].present?
          RecipeIngredient.create(quantity: recipe_ingredient[:quantity], ingredient_id: ingredient.id, cocktail_recipe_id: self.id ) 
        end
  
      end
  
    end
  end

