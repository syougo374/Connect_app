class TopsController < ApplicationController
  def index
    if user_signed_in?
      redirect_to posts_path(current_user)
    end
  end

end
