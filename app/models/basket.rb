class Basket < ActiveRecord::Base
    belongs_to :user
    belongs_to :food
    
    
    validates :food_course,  presence: true
      
    validates :user_id,  presence: true
      
    validates :user_id,  presence: true
end