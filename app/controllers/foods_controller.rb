class FoodsController < ApplicationController
    before_action :signed_in?, only: [:index, :edit, :update, :destroy]
    before_action :user_is_admin?, only: [:index, :edit, :update, :destroy]
    before_action :sign_check
    
    def new
        
     unless user_is_admin?
       redirect_to root_path
    end
        
  end
    
    def create
        @food=Food.new(food_params)
        if @food.save
            flash[:succes]= "Food added"
            Food.addFood(@food)
             redirect_to foods_path
        else 
            flash[:error]="Error"
            render 'new'
        end
    end
    
 def destroy
     Food.find(params[:id]).destroy
     flash[:success] = "Item deleted."
     redirect_to foods_path
  end
    
     def index
         @menu_food=Menu.todayFoods(Menu.todayMenu.weekday)
         @foods=Food.otherFood(params[:first_page],params[:second_page],params[:drink_page])
       
     end
    
    def edit
        @food = Food.find(params[:id])
        
    end
    def show
        @food = Food.find(params[:id]) 
    end
    
  def update
        @food = Food.find(params[:id])
      if @food.update_attributes(food_params)
          flash[:success] = "Item updated"
          redirect_to foods_path
    else
          flash[:error] = "Invalid data"
      render 'edit'
    end
  end
    
    private 
    
    def food_params
        params.require(:food).permit(:name, :price, :course)
    end
    
end
