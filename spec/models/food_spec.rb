require 'rails_helper'
require 'spec_helper'


describe Food do

  before do
    @food = Food.new(name: "Example Food", price: "32", course: "drink")
  end

  subject { @food }
  it { should respond_to(:name) }
  it { should respond_to(:price) }
  it { should respond_to(:course) }
  it { should respond_to(:users) }
  it { should respond_to(:orders) }
  it { should respond_to(:baskets) }
  it { should be_valid }

  describe "when name is not present" do
    before { @food.name='' }
    it { should_not be_valid }
  end

  describe "when price is not present" do
    before { @food.price='' }
    it { should_not be_valid }
  end

  describe "when price is to long" do
    before { @food.price=33333333333333 }
    it { should_not be_valid }
  end

  describe "when course is not present" do
    before { @food.course='' }
    it { should_not be_valid }
  end


end

