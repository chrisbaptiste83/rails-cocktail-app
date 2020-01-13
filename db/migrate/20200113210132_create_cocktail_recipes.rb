class CreateCocktailRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :cocktail_recipes do |t|
      t.integer :user_id 
      t.integer :category_id 
      t.string :title 
      t.text :description 
      t.text :directions 
      t.timestamps
    end
  end
end
