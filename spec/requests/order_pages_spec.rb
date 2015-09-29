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
    it { should_not have_title(target) }
    it { should have_title("") }
  end


  describe "for non-signed users" do
    before { visit dashboard_path }
    it_should_behave_like "non_signed_user", "Dashboard"
  end

  describe "for signed users" do
    before do
      sign_in @user
    end

    describe "Dashboard" do
      before { visit dashboard_path }
      it { should have_title("Dashboard") }
      it { should have_link("Monday") }
      it { should have_link("Tuesday") }
      it { should have_link("Wednesday") }
      it { should have_link("Thursday") }
      it { should have_link("Friday") }
      it { should have_link("Saturday") }
      it { should have_link("Sunday") }
    end

    describe "Weekday" do
      let (:weekday) { Date.today.strftime("%A") }
      describe "Weekday menu " do
        before do
          todayMenu
          visit dashboard_path
          click_on weekday

        end
        let(:food) { Food.last }
        it { should have_title("Menu") }
        it { should have_content("Menu for "+weekday) }
        it { should have_link("Add to Order") }
        it { should have_link("Confirm Order") }

        describe "add to basket" do

          before { click_link "Add to Order"
          visit dashboard_path
          click_on weekday }


          it { expect(Basket.all.count).to eq 0 }

        end


      end

    end

    describe "Page  Orders" do

      describe "User is not admin" do
        before {
          not_admin(@user)
          visit allorders_path }

        it { should have_title("Dashboard") }
      end

      describe "User is admin" do
        before {
          create_admin(@user)
          visit allorders_path
        }
        it { should have_title("Dates") }

        describe "No orders" do
          it { should have_content("No Orders") }
        end

        describe "Have orders" do
          before do
            prepareOrders(@user)
            visit allorders_path
          end
          after { Order.delete_all }

          it_should_behave_like "haveorders"


          describe "Yesterday orders" do
            before do
              yesterdayOrders
            end
            describe "not fined at today page" do
              before do
                visit allorders_path
              end
              it { should have_content("No Orders") }
              it { should have_button("Submit") }
            end

            describe "find yesterday orders " do
              before do
                fill_in "search", with: Date.yesterday.to_s
                click_on "Submit"
              end

              it_should_behave_like "haveorders"

            end

          end
        end


      end


    end
  end
end


