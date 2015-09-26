class CreateBaskets < ActiveRecord::Migration
  def change
    create_table :baskets do |t|
      t.integer :user_id
      t.integer :food_id
      t.string :food_course
      t.timestamps null: false
    end
  end
end
