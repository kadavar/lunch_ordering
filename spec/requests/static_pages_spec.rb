require 'rails_helper'
require 'spec_helper'
require 'support/utilities'

describe "Static pages" do
    
    describe "Home page" do

        it "should have the content 'Lunch Ordering'" do
    visit '/static_pages/home'
    expect(page).to have_content('Lunch Ordering')
  end
end

end
