class IndexBasketUserCourse < ActiveRecord::Migration
  def change
      add_index :baskets, [ :user_id,:food_course], unique:true
  end
end
