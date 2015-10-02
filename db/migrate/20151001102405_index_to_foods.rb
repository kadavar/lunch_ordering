class IndexToFoods < ActiveRecord::Migration
  def change
    add_index :order_foods, :order_id
    add_index :order_foods, :food_id
    add_index :orders, :user_id
  end
end
