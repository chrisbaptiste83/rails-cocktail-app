class CategoriesController < ApplicationController 

    def new 
        @category = Category.new 
    end 

    def show 

        @category = Category.find(params[:id]) 

    end  

    def index 
        @categories = Category.all 
    end 






end
