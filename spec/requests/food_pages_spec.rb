require 'rails_helper'
require 'spec_helper'

describe "Foods page" do
    subject {page}
    
    before do
          u=FactoryGirl.create(:user)
            sign_in u
            create_admin u
        visit newfood_path end
    
 
    after do
        User.all.each do |us|
            us.destroy
        end
    end
    
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
            
             describe "succes create food" do
             
                 subject { -> { click_button submit } }
                 it{ should change(Food, :count) }
                 it{ should change(Menu.todayMenu.foods , :count)}
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
    it{ should have_title('Today Menu')}
    it{ should have_content('All Food')}
  
    
    describe "pagination" do
        
        before(:all) { 
             visit foods_path
            32.times { FactoryGirl.create(:food) } }
        after(:all)  { Food.delete_all }
        
        
        let(:add) {'Add to Menu'}
      it { should have_selector('div.pagination') }

        it "should list each food" do
            Food.paginate(page: 1).each do |food|
            expect(page).to have_selector('li')
            expect(page).to have_link('Delete') 
        end
            
       end
       
      end
      describe "delete working" do
          before do
            FactoryGirl.create(:food)
            visit foods_path
          end
        it "have a link delete" do
            expect(page).to have_link('Delete')
            expect { click_on 'Delete' }.to change(Food, :count)
        end
      end
      
    describe 'add to menu' do
        before do
            FactoryGirl.create(:food)
            visit foods_path
        end
        
        it "add to menu"  do
        expect(page).to have_link('Delete')
        expect(page).to have_link('Add to Menu')
        expect { click_on 'Add to Menu' }.to change(Menu.todayMenu.foods, :count)
        expect(page).to have_link('Remove from Menu')
        expect(page).not_to have_link('Delete')
        end
    
        describe 'remove from menu' do
            before { click_on 'Add to Menu'}
            it "remove form menu" do
                expect(page).not_to have_link('Delete')
                expect(page).to have_link('Remove from Menu')         
                expect { click_on 'Remove from Menu' }.to change(Menu.todayMenu.foods, :count)
                expect(page).not_to have_link('Remove from Menu')
                expect(page).to have_link('Delete')
                expect(page).to have_link('Add to Menu')
                
            end
        end
        
    end
    
 end
describe "edit " do
    before do
        f=FactoryGirl.create(:food)
      visit edit_food_path(f)
    end
    it {should have_title('Edit Food')} 
    it { should have_selector('input') }
    it {should have_content('Update food')}      
     let(:submit) { "Update Food" }
    describe "with valid data" do
    before do
        fill_in "Price",         with: "32"
        fill_in "food[name]",         with: "Food"
    end
    
    describe "Should update Food " do
       before { click_button submit }
          it { should have_selector('div.alert.alert-success') }
           it { should_not have_selector('div.alert.alert-error') }
      
     end
    end

 describe "with invalid data" do
    before do
        fill_in "Price",         with: ""
        fill_in "food[name]",         with: ""
    end
   
    describe "Should update Food " do
       before { click_button submit }
          it { should_not have_selector('div.alert.alert-success') }
           it { should have_selector('div.alert.alert-error') }
      
     end
    end

end

end