class CocktailRecipesController < ApplicationController 
   
    def new 
        @cocktail_recipe = CocktailRecipe.new 
        @cocktail_recipe.ingredients.build 
        @cocktail_recipe.ingredients.build 
        @cocktail_recipe.ingredients.build 
        @cocktail_recipe.ingredients.build 
    end  


    def create 
        @cocktail_recipe = CocktailRecipe.new(cocktail_recipe_params) 
        @cocktail_recipe.user_id = current_user.id 
        
        
        if @cocktail_recipe.save 
          
        redirect_to cocktail_recipe_path(@cocktail_recipe) 
        
        else render :new
        end
      end
    
      def show
        @cocktail_recipe = CocktailRecipe.find(params[:id])
      end 

    def index 
        @cocktail_recipes = CocktailRecipe.all  
    end 

    def destroy
        CocktailRecipe.find(params[:id]).destroy
        redirect_to cocktail_recipes_url
      end

    def edit 
        @cocktail_recipe = CocktailRecipe.find(params[:id])
    end
     
    def update 
        @cocktail_recipe = CocktailRecipe.find(params[:id]) 
        @cocktail_recipe.update(cocktail_recipe_params) 

        redirect_to cocktail_recipe_path(@cocktail_recipe)

    end

      private

      def cocktail_recipe_params
        params.require(:cocktail_recipe).permit(:user_id, :category_name, :title, :directions, :description, ingredients_attributes:[:name], alcohol_types_attributes:[:name], alcohol_type_ids: [])
      end
end
