class StaticPagesController < ApplicationController
  def home
     unless !signed_in?
         redirect_to current_user
     end
  end

  def help
  end
end
