class AddIndexToFoodsMenu < ActiveRecord::Migration
  def change
    add_index :menu_foods, [:food_id, :menu_id], unique: true
  end
end
