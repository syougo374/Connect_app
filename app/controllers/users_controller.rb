class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @users = @user.posts.all
  end

end
