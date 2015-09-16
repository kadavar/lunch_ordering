class UsersController < ApplicationController
    has_many :roles, through: :user_role , source: :user
    
  def new
  end
end
