require 'rails_helper'

describe Menu do
    
    before do
        @menu=Menu.new(weekday: "weekday")
    end
    
    it {should respond_to(:weekday) }
    it {should respond_to(:foods) }
    

    it {should be_valid}
    
    
end
