require 'rails_helper'
require 'spec_helper'

RSpec.describe OrdersController, :type => :controller do

  describe "::getOrders" do
    before do
      @user=FactoryGirl.create(:user)
      sign_in(@user, no_capybara: true)
    end
    after { User.delete_all }

    context "when succes response" do
      it { expect(get :getJsons, :format => :json).to be_success }
    end
  end
end