class CommentsController < ApplicationController 

   before_action :authenticate_user!
   before_action :set_comment, only: [:destroy]
   before_action :authorize_comment!, only: [:destroy]

   def create
      @cocktail_recipe = CocktailRecipe.find(params[:cocktail_recipe_id])
      @comment = current_user.comments.new(comments_params)
      @comment.cocktail_recipe = @cocktail_recipe
     if @comment.save
        redirect_to cocktail_recipe_path(@comment.cocktail_recipe), notice: "Comment added."
     else
        redirect_to cocktail_recipe_path(@comment.cocktail_recipe), alert: @comment.errors.full_messages.to_sentence
     end
   end 

   def destroy
      recipe = @comment.cocktail_recipe
      @comment.destroy
      redirect_to cocktail_recipe_path(recipe), notice: "Comment removed."
   end


  private 

  def comments_params
    params.require(:comment).permit(:content)
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def authorize_comment!
    unless @comment.user_id == current_user.id
      redirect_to cocktail_recipe_path(@comment.cocktail_recipe), alert: "You are not authorized to delete this comment."
    end
  end

end
