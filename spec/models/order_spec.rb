require 'rails_helper'

describe Order do
    
    before do
        @order = Order.new(user_id: 3)
  end

    subject {@order}
    it {should respond_to(:user_id) }
    it {should respond_to(:foods) }
      it {should respond_to(:user) }
    it {should be_valid}
    
    describe "not valid order" do
        before {@o=Order.new}
        subject {@o}
        it{should_not be_valid}
    end
    
     describe "valid order" do
         before {@order.save} 
        it{should be_valid}
    end
    


end
