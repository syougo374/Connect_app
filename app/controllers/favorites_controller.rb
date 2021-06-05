class FavoritesController < ApplicationController
  def show
    # binding.irb
    # @user = User.find(params[:id])
    @favorites = current_user.favorites.all
  end
  def create
    # favorite = current_user.favorites.create(post_id: params[:post_id])
    # redirect_to posts_path, notice: "#{favorite.post.user.name}さんの投稿をお気に入りに登録しました"

    @favorite = Favorite.new(user_id: current_user.id, post_id: params[:post_id])
    @favorite.save
    redirect_to("/posts/#{params[:post_id]}")
  end
  def destroy
    # favorite = current_user.favorites.find_by(id: params[:id]).destroy
    # redirect_to posts_path, notice: "#{favorite.post.user.name}さんの投稿をお気に入り解除しました"
    @favorite = Favorite.find_by(user_id: current_user.id, post_id: params[:post_id])
    @favorite.destroy
    redirect_to("/posts/#{params[:post_id]}")
  end
end
