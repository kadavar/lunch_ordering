class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  before_create :create_remember_token, :assign_role
  has_many :roles, through: :UserRoles, source: :role
  has_many :UserRoles, dependent: :destroy

  has_many :orders

  has_many :baskets, dependent: :destroy
  has_many :foods, through: :baskets, source: :food
  validates :name, presence: true, length: {maximum: 50}
  validates :password, length: {minimum: 6}

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true, format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}

  has_secure_password

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def assign_role
    # first user - Lunch Admin
    if User.count==0
      self.roles= Role.all
    else
      self.roles=Role.where(role: "user")
    end
  end


  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

  def create_remember_token
    self.remember_token = User.encrypt(User.new_remember_token)
  end

end
