require 'rails_helper'
require 'spec_helper'

RSpec.describe OrdersController, :type => :controller do

  describe "get order response" do

    it "displays all users" do
      @user=FactoryGirl.create(:user)
      @order=Order.create(user_id:@user.id)
      get :getJsons, :format => :json
      @order_json = [{"order" => {"id" => @order.id, "user_id" => @user.id, "created_at" => Order.last.created_at, "updated_at" => Order.last.updated_at}}].to_json
      expect(Order.getJson).to  be_json_eql(@order_json)

    end
  end


end