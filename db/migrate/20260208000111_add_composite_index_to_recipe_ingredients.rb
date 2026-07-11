class AddCompositeIndexToRecipeIngredients < ActiveRecord::Migration[8.0]
  def change
    add_index :recipe_ingredients, [:cocktail_recipe_id, :ingredient_id], name: "idx_recipe_ingredients_on_recipe_and_ingredient"
  end
end
