require 'rails_helper'
require 'spec_helper'


#RSpec.configure {|c| c.include SessionsHelper }
describe BasketsController do



     let (:foo2d) {FactoryGirl.create(:food)}

     before { sign_in FactoryGirl.create(:user)}


end
