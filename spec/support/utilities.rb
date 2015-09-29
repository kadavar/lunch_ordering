include ApplicationHelper

def sign_in(user, options={})
  if options[:no_capybara]
    # Sign in when not using Capybara.
    remember_token = User.new_remember_token
    cookies[:remember_token] = remember_token
    user.update_attribute(:remember_token, User.encrypt(remember_token))
    self.current_user = user
  else
    visit signin_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Sign in"
    self.current_user = user
  end
end
def current_user=(user)
  @current_user = user
end

  def create_admin(user)
    Role.create!(role: "admin")
    Role.create!(role: "user")
    user.roles = Role.all
  end

  def not_admin(user)

    user.roles = Role.where(role:"user")
  end


  def todayMenu
    menu=Menu.find_by(weekday: Date.today.strftime("%A").downcase)
    menu.foods.push(Food.new(name: "foodfirst", price: 199, course: "first"))


  end

  def prepareOrders(u)
    32.times do
      @o= Order.create(user_id: u.id)
      @o.foods.push(Food.new(name: "foodfirst", price: 199, course: "first"))
      @o.foods.push(Food.new(name: "foodfirst", price: 199, course: "second"))
      @o.foods.push(Food.new(name: "foodfirst", price: 199, course: "drink"))
    end
    @o
  end

  def yesterdayOrders
    d=DateTime.now-1
     Order.find_each do |o|
       o.update_attributes(created_at:d)
     end
  end



