class Food < ActiveRecord::Base
  validates :name, length: {minimum: 3}, presence: true
  validates :course, length: {minimum: 3}, presence: true

  REGEX=/\-?\d+(\.\d{0,})?/i
  validates :price, presence: true, format: {with: REGEX}, length: {maximum: 15}
  has_many :menus, through: :MenuFoods, source: :menu
  has_many :MenuFoods, dependent: :destroy

  has_many :orders, through: :OrderFoods, source: :order
  has_many :OrderFoods, dependent: :destroy

  has_many :users, through: :baskets, source: :user
  has_many :baskets, dependent: :destroy


  def self.allFoods(page, page_second, page_drink)
    all=Food.all
    @food=Hash.new

    @food[:first]= all.where(course: "first").paginate(page: page)
    @food[:second] =all.where(course: "second").paginate(page: page_second)
    @food[:drink]= all.where(course: "drink").paginate(page: page_drink)
    @food

  end

  def self.addFood(food)
    Menu.todayMenu.foods.push(food)

  end

  def self.otherFood(page, page_second, page_drink)
    menufood=Menu.todayMenu.foods
    allFood=Food.all
    @food=Hash.new

    @food[:first]=(all.where(course: "first")-menufood.where(course: "first")).paginate(page: page)

    @food[:second]=(all.where(course: "second")-menufood.where(course: "second")).paginate(page: page_second)

    @food[:drink]=(all.where(course: "drink")-menufood.where(course: "drink")).paginate(page: page_drink)
    @food

  end

end
