class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def show
    @favorites = current_user.favorites.all.order(created_at: :desc).page(params[:page]).per(3)
  end

  def create
    @favorite = Favorite.new(user_id: current_user.id, post_id: params[:post_id])
    @favorite.save
    redirect_to post_path("#{params[:post_id]}"),notice: 'お気に入りに追加しました'
  end

  def destroy
    @favorite = Favorite.find_by(user_id: current_user.id, post_id: params[:post_id])
    @favorite.destroy
    redirect_to post_path("#{params[:post_id]}"),notice: "お気に入りから削除しました"
  end
end
