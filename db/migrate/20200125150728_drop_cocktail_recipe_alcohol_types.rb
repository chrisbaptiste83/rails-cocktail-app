class DropCocktailRecipeAlcoholTypes < ActiveRecord::Migration[6.0]
  def change 
    drop_table :cocktail_recipe_alcohol_types
  end
end
