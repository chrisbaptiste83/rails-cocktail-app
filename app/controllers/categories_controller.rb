class CategoriesController < ApplicationController 
    before_action :authenticate_user! 
    
    def new 
        @category = Category.new 
    end 

    def show 
        @category = Category.find(params[:id]) 
    end  

    def index 
        if params[:search]
            @categories = Category.search(params[:search]).order("created_at DESC") 
        elsif params[:search]
            @categories = Category.search(params[:search]).order("created_at DESC")
        else @categories = Category.all.order(:name) 
        end 
    end 






end
