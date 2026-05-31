require "test_helper"

class SmokeTest < ActionDispatch::IntegrationTest
  setup do
    @category = Category.create!(name: "Classic")
    @ingredient = Ingredient.create!(name: "Gin")

    @user = User.create!(
      username: "testuser",
      email: "test@example.com",
      password: "password123"
    )

    @cocktail_recipe = CocktailRecipe.create!(
      title: "Martini",
      description: "A classic cocktail",
      directions: "Stir with ice and strain",
      user: @user,
      category: @category
    )

    @comment = Comment.create!(
      content: "Delicious recipe",
      cocktail_recipe: @cocktail_recipe,
      user: @user
    )
    sign_in @user
  end

  test "home page responds successfully" do
    get root_url
    assert_response :success
  end

  test "health check responds successfully" do
    get rails_health_check_url
    assert_response :success
  end

  test "ingredients index responds successfully" do
    get ingredients_url
    assert_response :success
  end

  test "ingredient show responds successfully" do
    get ingredient_url(@ingredient)
    assert_response :success
  end

  test "categories index responds successfully" do
    get categories_url
    assert_response :success
  end

  test "category show responds successfully" do
    get category_url(@category)
    assert_response :success
  end

  test "cocktail recipes index responds successfully" do
    get cocktail_recipes_url
    assert_response :success
  end

  test "cocktail recipe show responds successfully" do
    get cocktail_recipe_url(@cocktail_recipe)
    assert_response :success
  end

  test "user show responds successfully" do
    get user_url(@user)
    assert_response :success
  end

  test "nested user cocktail recipes index responds successfully" do
    get user_cocktail_recipes_url(@user)
    assert_response :success
  end

end
