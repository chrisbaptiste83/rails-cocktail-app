class CocktailRecipesController < ApplicationController 

    before_action :find_cocktail_recipe, only: [:show, :edit, :update, :destroy] 
    before_action :authenticate_user!

    def new 
        @cocktail_recipe = CocktailRecipe.new 
        @ingredients = 6.times.collect { @cocktail_recipe.recipe_ingredients.build } 
        @comment = Comment.new 
    end  


    def create
      @cocktail_recipe = current_user.cocktail_recipes.new(cocktail_recipe_params) 
      if @cocktail_recipe.save
        @cocktail_recipe.add_ingredients_to_recipe(recipe_ingredient_params)
        redirect_to cocktail_recipe_path(@cocktail_recipe), notice: "Your recipe has successfully been added" 
      else  
        @ingredients = 6.times.collect { @cocktail_recipe.recipe_ingredients.build } 
        render :new
      end
    end
    
    def show   
      @comment = current_user.comments.build(cocktail_recipe: @cocktail_recipe)
    end 

    def index 
      @users = User.all 
        if params[:search]
          @cocktail_recipes = CocktailRecipe.search(params[:search]).order("created_at DESC")
        elsif !params[:user].blank?
          @cocktail_recipes = CocktailRecipe.by_user(params[:user]).order(:title)
        elsif params[:user_id]
          @cocktail_recipes = User.find(params[:user_id]).cocktail_recipes.order('title ASC')
        else
          @cocktail_recipes = CocktailRecipe.all.order(:title)
        end
    end 


    def edit  
        @i = 2.times.collect { @cocktail_recipe.recipe_ingredients.build }  
    end

    def destroy 
        @cocktail_recipe.destroy
        redirect_to cocktail_recipes_url
      end
     
    def update
        if @cocktail_recipe.update(cocktail_recipe_params)
          @cocktail_recipe.add_ingredients_to_recipe(recipe_ingredient_params)
          redirect_to @cocktail_recipe, notice: "Your recipe has successfully been updated"
        else 
          redirect_to new_cocktail_recipe_path
        end
      end

   private

   def cocktail_recipe_params
     params.require(:cocktail_recipe).permit(:user_id, :category_name, :title, :directions, :description, :avatar) 
   end 

   def recipe_ingredient_params
    params.require(:cocktail_recipe).permit(recipe_ingredients_attributes: [:quantity, :ingredient_id, ingredient: [:name]])
   end

   def find_cocktail_recipe
    @cocktail_recipe = CocktailRecipe.find(params[:id])
   end
    

end
