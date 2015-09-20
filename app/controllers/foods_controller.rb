class FoodsController < ApplicationController
 before_action :signed_in?, only: [:index, :edit, :update, :destroy]
    before_action :user_is_admin?, only: [:index, :edit, :update, :destroy]

    
    def new
     unless user_is_admin?
       redirect_to root_user
    end
  end
    
    def create
        @food=Food.new(food_params)
        if @food.save
            flash[:succes]= "Food added"
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
         unless user_is_admin? && signed_in?
       redirect_to root_path
       end
         @foods= Food.paginate(page: params[:page])
      
     end
    
    def edit
        @food = Food.find(params[:id])
        
    end
    def show
        @food = Food.find(params[:id]) 
    end
    
  def update
      if @food.update_attributes(food_params)
          flash[:success] = "Item updated"
          redirect_to foods_path
    else
      render 'edit'
    end
  end
    
    private 
    
    def food_params
        params.require(:food).permit(:name, :price, :course)
    end
    
end
