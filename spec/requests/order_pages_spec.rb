require 'rails_helper'
require 'spec_helper'

describe "Orders Pages" do
  before { @user=FactoryGirl.create(:user) }
  subject { page }

  shared_examples "haveorders" do
    it { should have_content("Orders:") }
    it { should have_selector('ul.orders_ul') }
    it { should have_selector('div.pagination') }
    it { should have_selector('li.order_li') }
  end

  shared_examples "non_signed_user" do |target|
    describe "visit #{target} page" do
      it { should_not have_title(title) }
      it { should have_title("") }
      it { should have_link("Sign in") }

    end

  end


  describe "Dashboard page" do
      describe "visit as non signed user" do
          before {
          visit dashboard_path}
          it_should_behave_like "non_signed_user", "Dashboard" do
            let(:title) {"Dashboard"}
          end
      end

      describe "for signed users" do
      before {
        sign_in @user
        visit dashboard_path }
      after {
        click_on "Sign out"
      }
      it { should have_title("Dashboard") }
      it { should have_link("Monday") }
      it { should have_link("Tuesday") }
      it { should have_link("Wednesday") }
      it { should have_link("Thursday") }
      it { should have_link("Friday") }
      it { should have_link("Saturday") }
      it { should have_link("Sunday") }

   describe "Weekday page" do
        before do
          todayMenu
          visit dashboard_path
          @today=Date.today.strftime("%A")
          click_on @today
        end

        let(:food) { Food.last }
        it { should have_title("Menu") }
        it { should have_content("Menu for "+@today.downcase) }
        it { should have_link("Add to Order") }
        it { should have_link("Confirm Order") }

     describe "Confirm empty order" do
       before {click_link "Confirm"}
       it {should have_title("Dashboard")}
       it {should have_selector("div.alert-error") }
     end

     describe "Create order" do
       before do
         visit dashboard_path
         prepareBasket(@user)
         click_on @today

       end

       describe "click Confirm Order " do
         subject { -> { click_on "Confirm Order" } }
         it { should change(Order, :count) }
           it { should change(Basket, :count) }
       end


     end



      end
      end

  end


  describe "Orders Page" do
    describe "visit as non signed user" do
      before {
       visit allorders_path}
      it_should_behave_like "non_signed_user", "Orders" do
        let(:title) {"Dates"}
      end
    end
    describe "User is not admin" do
      before {
        sign_in(@user)
        not_admin(@user)
        visit allorders_path }

      it { should have_title("Dashboard") }
    end

    describe "User is admin" do
      before {
        sign_in(@user)
        create_admin(@user)
        visit allorders_path
      }
      it { should have_title("Dates") }
      describe "Have no orders" do
        it {should have_content("No Orders")}
        it {should have_button("Submit")}
      end
      describe "Have orders" do
      before {
        prepareOrders(@user)
        visit allorders_path}
      after {Order.delete_all}
      it_should_behave_like "haveorders"


      describe "Yesterday orders" do
        before{
          yesterdayOrders
          visit allorders_path
        }
        describe "Not find yestarday orders " do
          it {should have_content("No Orders")}
          end
        describe "Find yestarday orders " do
          before {
            visit allorders_path
            fill_in "search", with: (Date.today-1).to_s
            click_on "Submit"
          }
          it_should_behave_like "haveorders"
        end

      end

      end

    end
  end



end