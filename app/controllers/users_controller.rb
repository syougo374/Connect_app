class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @users = @user.posts.all.order(created_at: :desc).page(params[:page]).per(3)
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
