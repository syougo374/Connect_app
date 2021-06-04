class RelationshipsController < ApplicationController
  before_action :authenticate_user!
  def create
    # binding.irb
  end

  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow!(@user)
  end
end
