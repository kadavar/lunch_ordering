require 'rails_helper'
require 'spec_helper'


RSpec.describe BasketsController, :type => :controller do
  describe "basket" do

    before do
      @user=FactoryGirl.create(:user)
      @food=FactoryGirl.create(:food)
      sign_in(@user, no_capybara: true)
    end
    after { User.delete_all }
    context "::create" do
      it do
        expect do
          xhr :post, :create, :food => @food.id
        end.to change(Basket, :count).by(1)
        expect do
          xhr :post, :create, :food => @food.id
        end.not_to change(Basket, :count)
      end
    end
    context "::destroy" do
      it do
        xhr :post, :create, :food => @food.id
        expect do
          xhr :delete, :destroy, :id => Basket.last.id
        end.to change(Basket, :count).by(-1)
      end
    end
  end
end
