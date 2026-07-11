class AddMissingConstraintsAndFixCommentsCount < ActiveRecord::Migration[8.0]
  def change
    change_column_default :cocktail_recipes, :comments_count, from: nil, to: 0
    up_only do
      execute 'UPDATE cocktail_recipes SET comments_count = 0 WHERE comments_count IS NULL'
    end
    change_column_null :cocktail_recipes, :comments_count, false, 0

    add_index :ingredients, :name, unique: true unless index_exists?(:ingredients, :name)

    add_foreign_key :cocktail_recipes, :users unless foreign_key_exists?(:cocktail_recipes, :users)
    add_foreign_key :cocktail_recipes, :categories unless foreign_key_exists?(:cocktail_recipes, :categories)
    add_foreign_key :recipe_ingredients, :cocktail_recipes unless foreign_key_exists?(:recipe_ingredients, :cocktail_recipes)
    add_foreign_key :recipe_ingredients, :ingredients unless foreign_key_exists?(:recipe_ingredients, :ingredients)
    add_foreign_key :comments, :cocktail_recipes unless foreign_key_exists?(:comments, :cocktail_recipes)
    add_foreign_key :comments, :users unless foreign_key_exists?(:comments, :users)
  end
end
