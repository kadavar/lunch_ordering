class CreateMenuFoods < ActiveRecord::Migration
  def change
    create_table :menu_foods do |t|
      t.integer :menu_id
      t.integer :food_id
      t.timestamps null: false
    end
  end
end
