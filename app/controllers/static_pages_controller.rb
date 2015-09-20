class StaticPagesController < ApplicationController
  def home
     unless !signed_in?
         redirect_to users_path
     end
  end

  def help
  end
end
