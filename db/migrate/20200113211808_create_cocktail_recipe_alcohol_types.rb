class CreateCocktailRecipeAlcoholTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :cocktail_recipe_alcohol_types do |t|
      t.integer :cocktail_recipe_id 
      t.integer :alcohol_type_id 
      t.timestamps
    end
  end
end
