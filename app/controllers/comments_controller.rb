class CommentsController < ApplicationController 

    def create
      @cocktail_recipe = CocktailRecipe.find(params[:cocktail_recipe_id])
      @comment = current_user.comments.new(comments_params)
      @comment.cocktail_recipe = @cocktail_recipe
     if @comment.save
        redirect_to cocktail_recipe_path(@comment.cocktail_recipe)
     else
        redirect_to cocktail_recipe_path(@comment.cocktail_recipe)
     end
   end 


   def destroy
    @comment = Comment.find(params[:id]) 
    @comment.destroy
      redirect_to cocktail_recipe_url
    end


private 

def comments_params
    params.require(:comment).permit(:content)
end

end