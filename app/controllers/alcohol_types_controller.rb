class AlcoholTypesController < ApplicationController 
    def new 
        @alcohol_type = AlcoholType.new 
    end 
end
