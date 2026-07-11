class AddForeignKeyToRecipeIngredientsOnCocktailRecipeId < ActiveRecord::Migration[8.0]
  def change
    add_foreign_key :recipe_ingredients, :cocktail_recipes
  end
end
