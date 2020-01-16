class AddNameToCocktailRecipeAlcoholTypes < ActiveRecord::Migration[6.0]
  def change
    add_column :cocktail_recipe_alcohol_types, :name, :string
  end
end
