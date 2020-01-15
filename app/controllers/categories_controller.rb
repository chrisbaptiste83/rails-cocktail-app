class CategoriesController < ApplicationController 

    def new 
        @category = Category.new 
    end 

    def show 

        @category = Category.find(params[:id]) 

    end 
    



end
