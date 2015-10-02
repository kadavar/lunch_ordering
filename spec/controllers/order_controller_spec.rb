require 'rails_helper'
require 'spec_helper'

RSpec.describe OrdersController, :type => :controller do

  before {
    @user=FactoryGirl.create(:user)
  }
end