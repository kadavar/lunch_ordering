class Role < ActiveRecord::Base
  validates :role, uniqueness: {case_sensitive: false}
  has_many :users, through: :UserRoles, source: :user
  has_many :UserRoles

  def getRoleId(role)
    ids=Role.find_by(role: role)
    if ids!=nil
      ids=ids.id
    end

  end


end
