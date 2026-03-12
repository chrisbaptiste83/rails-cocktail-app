require "test_helper"

class CocktailRecipeTest < ActiveSupport::TestCase
  def setup
    @recipe = cocktail_recipes(:mojito)
  end

  # --- Validations ---

  test "valid recipe is valid" do
    assert @recipe.valid?
  end

  test "title is required" do
    @recipe.title = nil
    assert_not @recipe.valid?
    assert_includes @recipe.errors[:title], "can't be blank"
  end

  test "description is required" do
    @recipe.description = nil
    assert_not @recipe.valid?
    assert_includes @recipe.errors[:description], "can't be blank"
  end

  test "directions is required" do
    @recipe.directions = nil
    assert_not @recipe.valid?
    assert_includes @recipe.errors[:directions], "can't be blank"
  end

  test "category_name is required" do
    @recipe.category = nil
    assert_not @recipe.valid?
    assert_includes @recipe.errors[:category_name], "can't be blank"
  end

  # --- Virtual attribute: category_name ---

  test "category_name returns the associated category name" do
    assert_equal "Cocktails", @recipe.category_name
  end

  test "category_name= finds an existing category" do
    assert_no_difference "Category.count" do
      @recipe.category_name = "Cocktails"
    end
    assert_equal "Cocktails", @recipe.category_name
  end

  test "category_name= creates a new category when it does not exist" do
    assert_difference "Category.count", 1 do
      @recipe.category_name = "Digestifs"
    end
    assert_equal "Digestifs", @recipe.category_name
  end

  # --- Scopes ---

  test "most_comments returns the recipe with the highest comment count" do
    top = CocktailRecipe.most_comments
    assert_equal cocktail_recipes(:mojito), top
  end

  test "five_latest_cocktail_recipes returns at most 5 records" do
    assert CocktailRecipe.five_latest_cocktail_recipes.count <= 5
  end

  test "five_latest_cocktail_recipes orders by newest first" do
    results = CocktailRecipe.five_latest_cocktail_recipes
    assert results.first.created_at >= results.last.created_at
  end

  test "of_the_day returns a single CocktailRecipe" do
    result = CocktailRecipe.of_the_day
    assert_instance_of CocktailRecipe, result
  end

  # --- Class methods ---

  test "by_user filters recipes by user_id" do
    alice = users(:alice)
    results = CocktailRecipe.by_user(alice.id)
    assert results.all? { |r| r.user_id == alice.id }
  end

  test "search returns recipes matching the title" do
    results = CocktailRecipe.search("Mojito")
    assert_includes results, cocktail_recipes(:mojito)
    assert_not_includes results, cocktail_recipes(:margarita)
  end

  test "search is case-insensitive via LIKE wildcard" do
    results = CocktailRecipe.search("mojito")
    assert_includes results, cocktail_recipes(:mojito)
  end

  test "search returns empty when no match" do
    assert CocktailRecipe.search("zzznomatch").empty?
  end

  # --- Instance methods: previous / next ---

  test "next returns the recipe that comes after alphabetically" do
    # Alphabetical order: Classic Mojito < Margarita < Virgin Mojito
    nxt = cocktail_recipes(:mojito).next
    assert_equal cocktail_recipes(:margarita), nxt
  end

  test "previous returns the recipe that comes before alphabetically" do
    # Virgin Mojito's previous is Margarita
    prev = cocktail_recipes(:virgin_mojito).previous
    assert_equal cocktail_recipes(:margarita), prev
  end

  test "previous returns nil for the first recipe alphabetically" do
    # Classic Mojito is first alphabetically among fixtures (C < M < V)
    assert_nil cocktail_recipes(:mojito).previous
  end

  # --- Associations ---

  test "belongs to user" do
    assert_respond_to @recipe, :user
    assert_equal users(:alice), @recipe.user
  end

  test "belongs to category" do
    assert_respond_to @recipe, :category
    assert_equal categories(:cocktails), @recipe.category
  end

  test "has many comments" do
    assert_respond_to @recipe, :comments
    assert_equal 2, cocktail_recipes(:mojito).comments.count
  end

  test "has many recipe_ingredients" do
    assert_respond_to @recipe, :recipe_ingredients
  end

  test "has many ingredients through recipe_ingredients" do
    assert_includes @recipe.ingredients, ingredients(:white_rum)
    assert_includes @recipe.ingredients, ingredients(:fresh_mint)
  end

  # --- add_ingredients_to_recipe ---

  test "add_ingredients_to_recipe replaces existing ingredients" do
    params = {
      recipe_ingredients_attributes: {
        "0" => { ingredient: { name: "Vodka" }, quantity: "2 oz" }
      }
    }

    assert_difference "RecipeIngredient.count", -2 do  # removes 3 mojito, adds 1
      @recipe.add_ingredients_to_recipe(params)
    end

    names = @recipe.reload.ingredients.pluck(:name)
    assert_includes names, "Vodka"
    assert_not_includes names, "White Rum"
  end
end
