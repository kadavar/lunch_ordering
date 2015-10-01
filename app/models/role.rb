class Role < ActiveRecord::Base
  validates :role, uniqueness: {case_sensitive: false}
  has_many :users, through: :UserRoles, source: :user
  has_many :UserRoles

end
