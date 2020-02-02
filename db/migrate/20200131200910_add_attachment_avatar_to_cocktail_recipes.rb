class AddAttachmentAvatarToCocktailRecipes < ActiveRecord::Migration[6.0]
  def self.up
    change_table :cocktail_recipes do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :cocktail_recipes, :avatar
  end
end
