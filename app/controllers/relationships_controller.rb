class RelationshipsController < ApplicationController
  before_action :authenticate_user!
  def create
    # binding.irb
    @user = User.find(params[:relationship][:followed_id])
    current_user.follow!(@user),notice: 'フォローしました'
  end

  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow!(@user),notice: 'フォロー解除'
  end
end
