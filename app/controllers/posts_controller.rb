class PostsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only:[:new, :edit, :update, :destroy]
  def index
  end

  def create 
    @post = current_user.tasks.build(post_params)
    if @post.save

      
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
  def post_params
    params.require(:post).permit(:title, :content, :image, :address)
  end
end
