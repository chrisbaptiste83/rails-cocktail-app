class CreateCocktailRecipeAlcoholTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :cocktail_recipe_alcohol_types do |t|

      t.timestamps
    end
  end
end
