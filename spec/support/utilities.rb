include ApplicationHelper

def sign_in(user, options={})
  if options[:no_capybara]
    # Sign in when not using Capybara.
    remember_token = User.new_remember_token
    cookies[:remember_token] = remember_token
    user.update_attribute(:remember_token, User.encrypt(remember_token))
  else
    visit signin_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Sign in"
  end


  def create_admin(user)
    Role.create!(role: "admin")
    Role.create!(role: "user")
    user.roles = Role.all
  end


  def todayMenu
    menu=Menu.find_by(weekday: Date.today.strftime("%A").downcase)
    menu.foods.push(Food.new(name: "foodfirst", price: 199, course: "first"))

  end

  def prepareOrder(u)
    @o= Order.create(user_id: u.id)
    @o.foods.push(Food.new(name: "foodfirst", price: 199, course: "first"))
    @o.foods.push(Food.new(name: "foodfirst", price: 199, course: "second"))
    @o.foods.push(Food.new(name: "foodfirst", price: 199, course: "drink"))
    @o
  end

end