class MenusController < ApplicationController
    
    def addFood
        if Menu.todayMenu.foods.push(Food.find(params[:id]))
            flash[:success] = "Food added to Menu "
       
        else 
            flash[:error] = "Already in menu"
        end
         redirect_to foods_path
    end
    def deleteFood
        Menu.todayMenu.foods.delete(params[:id])
        redirect_to foods_path
    end
end
