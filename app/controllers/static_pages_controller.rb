class StaticPagesController < ApplicationController
  def home
      if(signed_in? )
          redirect_to dashboard_path
      end
  end

  def help
  end
end
