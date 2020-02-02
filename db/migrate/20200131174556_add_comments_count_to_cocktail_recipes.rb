class AddCommentsCountToCocktailRecipes < ActiveRecord::Migration[6.0]
  def change
    add_column :cocktail_recipes, :comments_count, :integer
  end
end
