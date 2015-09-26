require 'rails_helper'
require 'spec_helper'

describe "Orders Pages" do
  subject { page }

  describe "for non-signed users" do
    before { visit dashboard_path }
    it { should_not have_title("Dashboard") }
    it { should have_title("") }
  end

  describe "for signed users" do
    before do
      @u=FactoryGirl.create(:user)
      sign_in @u
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


    describe "Weelday" do
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
  end
end