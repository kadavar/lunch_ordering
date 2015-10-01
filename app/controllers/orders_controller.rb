class OrdersController < ApplicationController
  before_action :sign_check
  before_action :admin_check ,only: :show

  def new
  end



  def getJsons
    render :json => Order.getJson
  end

  def dashboard
  end

  def show
    @today_orders=Order.todayOrders(params[:search], params[:page])
    @total=Order.totalPrice(@today_orders)
    @date=Order.ordersFor(params[:search])
  end

  def weekday
    @foods=Menu.todayFoods(params[:weekday])
    @weekday=params[:weekday]
  end

  def create
    if (current_user.foods!=Food.none)
      Order.createOrder(current_user.id)
      flash[:succes]= "Your order create!"
    else
      flash[:error]= "Please choose food for menu!"
    end
    redirect_to dashboard_path
  end

end
