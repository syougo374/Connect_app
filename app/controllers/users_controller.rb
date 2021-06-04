class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @users = @user.posts.all
  end
  def followers
    @user = User.find(params[:id])
    @users = @user.followers
    render 'show_follow'
  end

  def following
    @user = User.find(params[:id])
    @users = @user.following
    render 'show_follower'
  end

end
