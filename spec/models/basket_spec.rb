require 'rails_helper'
require 'spec_helper'

describe Basket do
  before do
    @basket=Basket.new(food_id: 22, user_id: 22, food_course: "first")
  end
  subject { @basket }
  it { should respond_to(:food_id) }
  it { should respond_to(:user_id) }
  it { should respond_to(:food_course) }
  it { should respond_to(:user) }
  it { should respond_to(:food) }
  it { should be_valid }

  describe "not valid basket with" do
    before { @b=Basket.create }
    subject { @b }

    describe "empty all fields" do
      before { @b=Basket.create }

      it { should_not be_valid }
    end

    describe "empty user_id" do
      before { @b=Basket.create(food_id: 2, food_course: "first") }

      it { should_not be_valid }
    end


    describe "empty food_coruse" do
      before { @b=Basket.create(user_id: 2, food_id: 2, food_course: "") }
      it { should_not be_valid }
    end
  end


end

