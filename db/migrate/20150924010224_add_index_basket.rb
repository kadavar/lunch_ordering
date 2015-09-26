class AddIndexBasket < ActiveRecord::Migration
  def change
    add_index :baskets, [:food_id, :user_id, :food_course], unique: true
    add_index :baskets, [:food_id, :user_id], unique: true
  end
end
