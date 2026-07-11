require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  def setup
    @category = categories(:cocktails)
  end

  # --- Associations ---

  test "has many cocktail_recipes" do
    assert_respond_to @category, :cocktail_recipes
    assert_includes @category.cocktail_recipes, cocktail_recipes(:mojito)
    assert_includes @category.cocktail_recipes, cocktail_recipes(:margarita)
  end

  # --- Class methods ---

  test "search returns categories matching the name" do
    results = Category.search("Cocktails")
    assert_includes results, categories(:cocktails)
  end

  test "search is partial match" do
    results = Category.search("mock")
    assert_includes results, categories(:mocktails)
    assert_not_includes results, categories(:cocktails)
  end

  test "search returns empty when no match" do
    assert Category.search("zzznomatch").empty?
  end

  test "name must be unique" do
    duplicate = Category.new(name: @category.name)

    assert_not duplicate.valid?
    assert_includes duplicate.errors[:name], "has already been taken"
  end
end
