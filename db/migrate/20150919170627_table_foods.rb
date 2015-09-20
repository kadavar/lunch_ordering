class TableFoods < ActiveRecord::Migration
  def change
      create_table :foods do |t|
        t.string :name
          t.real :price   
          t.string :course
      t.timestamps 
    end
  end
end
