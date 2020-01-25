class DropAlcoholTypes < ActiveRecord::Migration[6.0]
  def change 
    
      drop_table :alcohol_types
    
  end 

  def down
    fail ActiveRecord::IrreversibleMigration
  end

end
