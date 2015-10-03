require 'rails_helper'
require 'spec_helper'

RSpec.describe OrdersController, :type => :controller do

  describe "Order Controller" do

    it "::getOrders" do
      @user=FactoryGirl.create(:user)
      sign_in(@user,no_capybara: true)
      get :getJsons, :format => :json
      response.should be_success
      User.delete_all
    end
  end
end