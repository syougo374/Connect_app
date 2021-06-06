class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only:[:new, :edit, :update, :destroy]
  before_action :set_q, only: [:index, :search]

  def index
    # @posts = Post.all.page(params[:page]).per(10)
    @posts = Post.order(created_at: :desc).all.page(params[:page]).per(4)
  end

  def search
    @results = @q.result
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def edit
  end

  def show
    @favorite = current_user.favorites.find_by(post_id: @post.id)
  end

  def new
    @post = Post.new
  end

  private
  def set_post
    @post = Post.find(params[:id])
  end

  def set_q
    @q = Post.ransack(params[:q])
  end

  def post_params
    params.require(:post).permit(:title, :content, :image, :address, :image_cash, :user_id)
  end
end
