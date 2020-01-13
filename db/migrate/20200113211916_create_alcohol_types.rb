class CreateAlcoholTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :alcohol_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
