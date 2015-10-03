require 'rails_helper'
require 'spec_helper'



RSpec.describe BasketsController, :type => :controller do

  describe "basket" do

    User.delete_all

    it "::create" do
 #     it_should_behave_like "non_"
      @user=FactoryGirl.create(:user)
      @food=FactoryGirl.create(:food)
      sign_in(@user, no_capybara: true)
      expect do
        xhr :post, :create, :food => @food.id
      end.to change(Basket, :count).by(1)
      expect do
        xhr :post, :create, :food => @food.id
      end.not_to change(Basket, :count)

    end
    it "::destroy" do
      @user=FactoryGirl.create(:user)
      @food=FactoryGirl.create(:food)
      sign_in(@user, no_capybara: true)
      @basket=Basket.create(food_id: @food.id, user_id: @user.id, food_course: @food.course)
      expect do
        xhr :delete, :destroy, :id => @basket.id
      end.to change(Basket, :count).by(-1)
      User.delete_all
    end

  end
end
