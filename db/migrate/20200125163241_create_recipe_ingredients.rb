class CreateRecipeIngredients < ActiveRecord::Migration[6.0]
  def change
    create_table :recipe_ingredients do |t|
      t.string :quantity
      t.belongs_to :cocktail_recipe
      t.belongs_to :ingredient
      t.timestamps
    end
  end
end
