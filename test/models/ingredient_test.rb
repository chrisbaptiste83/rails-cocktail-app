require "test_helper"

class IngredientTest < ActiveSupport::TestCase
  def setup
    @ingredient = ingredients(:white_rum)
  end

  # --- Validations ---

  test "valid ingredient is valid" do
    assert @ingredient.valid?
  end

  test "name is required" do
    @ingredient.name = nil
    assert_not @ingredient.valid?
    assert_includes @ingredient.errors[:name], "can't be blank"
  end

  test "name must be unique" do
    duplicate = Ingredient.new(name: @ingredient.name)
    assert_not duplicate.valid?
    assert_includes duplicate.errors[:name], "has already been taken"
  end

  # --- Class methods ---

  test "search returns ingredients matching the name" do
    results = Ingredient.search("Rum")
    assert_includes results, ingredients(:white_rum)
  end

  test "search is partial match" do
    results = Ingredient.search("Lime")
    assert_includes results, ingredients(:lime_juice)
    assert_not_includes results, ingredients(:white_rum)
  end

  test "search returns empty when no match" do
    assert Ingredient.search("zzznomatch").empty?
  end

  # --- Associations ---

  test "has many recipe_ingredients" do
    assert_respond_to @ingredient, :recipe_ingredients
  end

  test "has many cocktail_recipes through recipe_ingredients" do
    assert_respond_to @ingredient, :cocktail_recipes
    assert_includes ingredients(:white_rum).cocktail_recipes, cocktail_recipes(:mojito)
  end
end
