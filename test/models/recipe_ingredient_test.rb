require "test_helper"

class RecipeIngredientTest < ActiveSupport::TestCase
  def setup
    @ri = recipe_ingredients(:mojito_rum)
  end

  # --- Associations ---

  test "belongs to cocktail_recipe" do
    assert_respond_to @ri, :cocktail_recipe
    assert_equal cocktail_recipes(:mojito), @ri.cocktail_recipe
  end

  test "belongs to ingredient" do
    assert_respond_to @ri, :ingredient
    assert_equal ingredients(:white_rum), @ri.ingredient
  end

  # --- Data integrity ---

  test "stores quantity" do
    assert_equal "2 oz", @ri.quantity
  end

  test "can be created with a valid cocktail_recipe and ingredient" do
    assert_difference "RecipeIngredient.count", 1 do
      RecipeIngredient.create!(
        cocktail_recipe: cocktail_recipes(:virgin_mojito),
        ingredient: ingredients(:simple_syrup),
        quantity: "0.5 oz"
      )
    end
  end

  test "rejects duplicate ingredient for the same recipe" do
    assert_raises(ActiveRecord::RecordInvalid) do
      RecipeIngredient.create!(
        cocktail_recipe: @ri.cocktail_recipe,
        ingredient: @ri.ingredient,
        quantity: "1 oz"
      )
    end
  end
end
