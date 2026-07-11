class AddMissingForeignKeyIndexes < ActiveRecord::Migration[8.0]
  def change
    add_index :cocktail_recipes, :user_id
    add_index :cocktail_recipes, :category_id
    add_index :comments, :cocktail_recipe_id
    add_index :comments, :user_id
  end
end
