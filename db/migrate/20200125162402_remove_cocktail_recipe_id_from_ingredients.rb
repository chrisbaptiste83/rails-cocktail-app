class RemoveCocktailRecipeIdFromIngredients < ActiveRecord::Migration[6.0]
  def change 
    remove_column :ingredients, :cocktail_recipe_id, :integer
  end
end
