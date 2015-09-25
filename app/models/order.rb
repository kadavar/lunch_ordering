class Order < ActiveRecord::Base
    validates :user_id,  presence: true
    has_many :foods, through: :OrderFoods , source: :food
    has_many :OrderFoods , dependent: :destroy
    belongs_to :user
   
    def self.ordersFor(search)
    if search 
           d=search.to_date
            else 
        d=Date.today.strftime
         end
        d
    end
    
    def self.OrderPrice
        
    end
    
    def self.todayOrders(search,page)
        if search 
           d=search.to_date
            else 
             d=Date.today
         end
        @today_orders=Order.where(created_at: d..d.end_of_day).paginate(page: page)
    end
    
    
    def self.totalPrice(orders)
        total=0
        orders.each do |o|
        total+=o.foods.sum(:price)
        end
        total
    end
    
    
    def self.createOrder(id)
        us=User.find(id)
        @order=Order.create(user_id:id)
        @order.foods=us.foods
        us.foods=[]
    end
    
    def self.getJson
         d=Date.today
         @today_orders=Order.where(created_at: d..d.end_of_day)
        ActiveRecord::Base.include_root_in_json = true
        @json=@today_orders.to_json
    end
    
end
