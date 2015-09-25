class Menu < ActiveRecord::Base
    has_many :foods, through: :MenuFoods , source: :food
    has_many :MenuFoods , dependent: :destroy
    
    
    def self.todayMenu
@menu=Menu.find_by(weekday: Date.today.strftime("%A").downcase)
    end
    
     def self.todayFoods  (weekday)
         @today_foods=Hash.new
         @foods=Menu.find_by(weekday: weekday).foods
         @today_foods[:first]=@foods.where(course: "first")
         @today_foods[:second]=@foods.where(course: "second")
         @today_foods[:drink]=@foods.where(course: "drink")
         @today_foods
    end
end
