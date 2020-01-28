class CocktailRecipesController < ApplicationController 
    before_action :authenticate_user! 

    def new 
        @cocktail_recipe = CocktailRecipe.new 
        @ingredients = 6.times.collect { @cocktail_recipe.recipe_ingredients.build }  
    end  


    def create
        @cocktail_recipe = current_user.cocktail_recipes.new(cocktail_recipe_params)
        if @cocktail_recipe.save
          @cocktail_recipe.add_ingredients_to_recipe(recipe_ingredient_params) 
        
          redirect_to @cocktail_recipe, notice: "Your recipe has successfully been added"
        else
          @cocktail_recipe = CocktailRecipe.new
          redirect_to new_cocktail_recipe_url
        end
      end
    
      def show 
        @cocktail_recipe = CocktailRecipe.find(params[:id])  
      end 

    def index 
        if params[:user_id]
            @cocktail_recipes = User.find(params[:user_id]).cocktail_recipes
          else
            @cocktail_recipes = CocktailRecipe.all
          end
        end

    def destroy
      @cocktail_recipe = CocktailRecipe.find(params[:id]) 
      @cocktail_recipe.destroy
        redirect_to cocktail_recipes_url
      end
 
    def edit 
        @cocktail_recipe = CocktailRecipe.find(params[:id]) 
        @i = 2.times.collect { @cocktail_recipe.recipe_ingredients.build } 
    end
     
    def update
      @cocktail_recipe = CocktailRecipe.find(params[:id])
        if @cocktail_recipe.update(cocktail_recipe_params)
          @cocktail_recipe.add_ingredients_to_recipe(recipe_ingredient_params)
          redirect_to @cocktail_recipe, notice: "Your recipe has successfully been updated"
        else 
          redirect_to new_cocktail_recipe_path
        end
      end

      private

      def cocktail_recipe_params
        params.require(:cocktail_recipe).permit(:user_id, :category_name, :title, :directions, :description) 
      end 

      def recipe_ingredient_params
            params.require(:cocktail_recipe).permit(recipe_ingredients_attributes: [:quantity, :ingredient_id, ingredient: [:name]])
          end
        

end
