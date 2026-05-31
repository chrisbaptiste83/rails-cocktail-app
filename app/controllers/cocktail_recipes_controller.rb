class CocktailRecipesController < ApplicationController 

    before_action :authenticate_user!
    before_action :find_cocktail_recipe, only: [:show, :edit, :update, :destroy] 
    before_action :authorize_cocktail_recipe!, only: [:edit, :update, :destroy]

    def new 
        @cocktail_recipe = CocktailRecipe.new 
        @ingredients = 6.times.collect { @cocktail_recipe.recipe_ingredients.build } 
        @comment = Comment.new 
    end  


    def create
      @cocktail_recipe = CocktailRecipeService.create_with_ingredients(
        current_user, cocktail_recipe_params, recipe_ingredient_params
      )
      if @cocktail_recipe.persisted?
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
      @cocktail_recipes = CocktailRecipeIndexQuery.new(params).call
    end 


    def edit  
        @i = 2.times.collect { @cocktail_recipe.recipe_ingredients.build }  
    end

    def destroy 
        @cocktail_recipe.destroy
        redirect_to cocktail_recipes_url
      end
     
    def update
        if CocktailRecipeService.update_with_ingredients(
             @cocktail_recipe, cocktail_recipe_params, recipe_ingredient_params
           )
          redirect_to @cocktail_recipe, notice: "Your recipe has successfully been updated"
        else 
          redirect_to new_cocktail_recipe_path
        end
      end

   private

   def cocktail_recipe_params
     params.require(:cocktail_recipe).permit(:category_name, :title, :directions, :description, :avatar) 
   end 

   def recipe_ingredient_params
    params.require(:cocktail_recipe).permit(recipe_ingredients_attributes: [:quantity, :ingredient_id, ingredient: [:name]])
   end

   def find_cocktail_recipe
    @cocktail_recipe = CocktailRecipe.find(params[:id])
   end
    
   def authorize_cocktail_recipe!
     unless @cocktail_recipe.user_id == current_user.id
       redirect_to cocktail_recipes_url, alert: "You are not authorized to modify this recipe."
     end
   end

end
