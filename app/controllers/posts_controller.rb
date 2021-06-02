class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only:[:new, :edit, :update, :destroy]
  def index
    @posts = Post.all
  end

  def create 
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to posts_path
      
    end
  end

  def edit
  end

  def show
  end

  def new
    @post = Post.new
  end

  private
  def set_post
    @post = Post.find(params[:id])
  end
  def post_params
    params.require(:post).permit(:title, :content, :image, :address, :image_cash, :user_id )
  end
end
