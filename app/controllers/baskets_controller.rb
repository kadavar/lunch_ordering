class BasketsController < ApplicationController


  def create
    already_exist=Basket.find_by(user_id: current_user.id, food_course: Food.find(params[:food]).course)
    if (already_exist)
      already_exist.destroy
    end
    Basket.create(food_id: params[:food], user_id: current_user.id, food_course: Food.find(params[:food]).course)
    respond_to do |format|
      format.js
    end
  end

  def destroy
    Basket.find(params[:id]).destroy

    respond_to do |format|


      format.js

    end

  end
end
