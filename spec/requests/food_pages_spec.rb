require 'rails_helper'
require 'spec_helper'

describe "Foods page" do
    subject {page}
    
     before { 
          u=FactoryGirl.create(:user)
            sign_in u
            create_admin u
            visit newfood_path }
    
    describe "new food" do

        it{ should have_title('New Food')}
        it{ should have_content('New Food')}
        
    
    describe "add a new food" do
        before { visit newfood_path}
        
         let(:submit) { "Create Food" }
    
        describe "with invalid data" do
            before {click_button submit}
            
            it "should not create food" do 
            expect { click_button submit }.not_to change(Food, :count)        
            end
            
            it { should have_selector('div.alert.alert-error') }
        end
        
         describe "with valid data" do
            before do 
                visit newfood_path
                
                fill_in "Price",         with: "32"
                fill_in "food[name]",         with: "Food"
            end
             
            let(:submit) { "Create Food" }
            
             it "succes create food" do
             expect { click_button submit }.to change(Food, :count)
            end
             
             describe "after succes create food" do
              before do 
                visit newfood_path
                fill_in "Price",         with: "32"
                fill_in "food[name]",         with: "Food"
                click_button submit
             end
             it { should_not have_selector('div.alert.alert-success') }
             end    
        end
       end
   end

describe "index" do 
    before do 
        visit foods_path
    end
   it{ should have_title('All Food')}
   it{ should have_content('All Food')}
    
end


end