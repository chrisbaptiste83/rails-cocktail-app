class AddUniqueIndexToCategoriesName < ActiveRecord::Migration[8.0]
  def up
    execute <<~SQL.squish
      UPDATE cocktail_recipes
      SET category_id = (
        SELECT MIN(canonical.id)
        FROM categories canonical
        WHERE canonical.name = (
          SELECT duplicate.name
          FROM categories duplicate
          WHERE duplicate.id = cocktail_recipes.category_id
        )
      )
      WHERE category_id IS NOT NULL
    SQL

    execute <<~SQL.squish
      DELETE FROM categories
      WHERE id NOT IN (
        SELECT MIN(id)
        FROM categories
        GROUP BY name
      )
    SQL

    add_index :categories, :name, unique: true, if_not_exists: true
  end

  def down
    remove_index :categories, :name, if_exists: true
  end
end
