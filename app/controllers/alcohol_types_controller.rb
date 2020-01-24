class AlcoholTypesController < ApplicationController 
    before_action :authenticate_user! 

    def new 
        @alcohol_type = AlcoholType.new 
    end 

    def show 
        @alcohol_type = AlcoholType.find(params[:id]) 
    end 
    
    def index 
        @alcohol_types = AlcoholType.all 
    end 

end
