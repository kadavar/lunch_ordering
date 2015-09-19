require 'rails_helper'

describe "Foods page" do
    subject {page}
    
    describe "index" do
        before { visit foods_path }
    end
    
end