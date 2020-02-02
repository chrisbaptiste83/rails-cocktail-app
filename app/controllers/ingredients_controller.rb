class IngredientsController < ApplicationController 

    def index 
        if params[:search]
            @ingredients = Ingredient.search(params[:search]).order("created_at DESC")
        else @ingredients = Ingredient.all.order(:name) 
        end 
    end

    def show
        @ingredient = Ingredient.find(params[:id]) 
    end 
    
end
