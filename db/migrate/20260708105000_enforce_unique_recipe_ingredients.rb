class EnforceUniqueRecipeIngredients < ActiveRecord::Migration[8.0]
  INDEX_NAME = "idx_recipe_ingredients_on_recipe_and_ingredient"

  def up
    execute <<~SQL.squish
      DELETE FROM recipe_ingredients
      WHERE cocktail_recipe_id IS NOT NULL
        AND ingredient_id IS NOT NULL
        AND id NOT IN (
          SELECT MIN(id)
          FROM recipe_ingredients
          WHERE cocktail_recipe_id IS NOT NULL
            AND ingredient_id IS NOT NULL
          GROUP BY cocktail_recipe_id, ingredient_id
        )
    SQL

    remove_index :recipe_ingredients, name: INDEX_NAME, if_exists: true
    add_index :recipe_ingredients, [ :cocktail_recipe_id, :ingredient_id ], unique: true, name: INDEX_NAME
  end

  def down
    remove_index :recipe_ingredients, name: INDEX_NAME, if_exists: true
    add_index :recipe_ingredients, [ :cocktail_recipe_id, :ingredient_id ], name: INDEX_NAME
  end
end
