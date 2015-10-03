require 'rails_helper'
require 'spec_helper'

RSpec.describe OrdersController, :type => :controller do

  describe "get order response" do

    it "get orders.json" do
      @user=FactoryGirl.create(:user)
      sign_in(@user,no_capybara: true)
      get :getJsons, :format => :json
      response.should be_success
      User.delete_all
    end
  end
end