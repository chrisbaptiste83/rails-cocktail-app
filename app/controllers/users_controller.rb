class UsersController < ApplicationController 

    def show
        @user = User.find(params[:id]) 
        @cocktail_recipes = CocktailRecipe.all
    end 

    

end
