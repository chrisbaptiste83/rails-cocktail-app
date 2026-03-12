require "test_helper"

class CommentTest < ActiveSupport::TestCase
  def setup
    @comment = comments(:delicious)
  end

  # --- Associations ---

  test "belongs to cocktail_recipe" do
    assert_respond_to @comment, :cocktail_recipe
    assert_equal cocktail_recipes(:mojito), @comment.cocktail_recipe
  end

  test "belongs to user" do
    assert_respond_to @comment, :user
    assert_equal users(:bob), @comment.user
  end

  # --- Counter cache ---

  test "creating a comment increments the recipe's comments_count" do
    recipe = cocktail_recipes(:margarita)
    before = recipe.comments_count.to_i

    Comment.create!(
      content: "Great drink!",
      cocktail_recipe: recipe,
      user: users(:alice)
    )

    assert_equal before + 1, recipe.reload.comments_count
  end

  test "destroying a comment decrements the recipe's comments_count" do
    recipe = cocktail_recipes(:mojito)
    before = recipe.comments_count.to_i

    comments(:delicious).destroy

    assert_equal before - 1, recipe.reload.comments_count
  end
end
