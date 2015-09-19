class FoodsController < ApplicationController
  def new
      
      
  end
    
     def index
       unless user_is_admin?
       redirect_to current_user
       end
     end
end
