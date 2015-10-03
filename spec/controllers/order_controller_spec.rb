require 'rails_helper'
require 'spec_helper'

RSpec.describe OrdersController, :type => :controller do

  describe "get order response" do

    it "displays all users" do
      @user=FactoryGirl.create(:user)
      sign_in(@user,no_capybara: true)
      get :getJsons, :format => :json

       response.should be_success

    end
  end


end