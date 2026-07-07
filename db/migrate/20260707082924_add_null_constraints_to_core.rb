class AddNullConstraintsToCore < ActiveRecord::Migration[8.0]
  def change
    change_column_null :categories, :name, false
    change_column_null :cocktail_recipes, :title, false
    change_column_null :ingredients, :name, false
    change_column_null :recipe_ingredients, :quantity, false
  end
end
