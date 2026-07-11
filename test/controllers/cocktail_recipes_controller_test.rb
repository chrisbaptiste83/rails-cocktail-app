require 'test_helper'

class CocktailRecipesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @alice = users(:alice)
    @bob = users(:bob)
    @mojito = cocktail_recipes(:mojito) # belongs to alice
  end

  test "cannot edit someone else's recipe" do
    sign_in @bob
    get edit_cocktail_recipe_path(@mojito)
    assert_redirected_to cocktail_recipes_url
    assert_equal "You are not authorized to modify this recipe.", flash[:alert]
  end

  test "cannot update someone else's recipe" do
    sign_in @bob
    patch cocktail_recipe_path(@mojito), params: { cocktail_recipe: { title: "Hacked" } }
    assert_redirected_to cocktail_recipes_url
    assert_equal "You are not authorized to modify this recipe.", flash[:alert]
  end

  test "cannot destroy someone else's recipe" do
    sign_in @bob
    assert_no_difference('CocktailRecipe.count') do
      delete cocktail_recipe_path(@mojito)
    end
    assert_redirected_to cocktail_recipes_url
    assert_equal "You are not authorized to modify this recipe.", flash[:alert]
  end

  test "handles invalid params on update gracefully" do
    sign_in @alice
    patch cocktail_recipe_path(@mojito), params: { cocktail_recipe: { title: "" } }
    assert_response :unprocessable_entity
    assert_template :edit
  end
end
