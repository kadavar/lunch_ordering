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





  def self.addFood(food)
    Menu.todayMenu.foods.push(food)

  end

def self.otherByCourse(course,page)
  (Food.all.where(course: course)-Menu.todayMenu.foods.where(course: course)).paginate(page: page)
end

  def self.otherFood(page, page_second, page_drink)

    @food=Hash.new
    @food[:first]=otherByCourse("first",page)
    @food[:second]=otherByCourse("second",page_second)
    @food[:drink]=otherByCourse("drink",page_drink)
    @food

  end

end
