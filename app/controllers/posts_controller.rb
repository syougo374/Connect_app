class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only:[:new, :edit, :update, :destroy]
  before_action :set_q, only: [:index, :search]

  def index
    # @posts = Post.all.page(params[:page]).per(10)
    @posts = Post.order(created_at: :desc).all.page(params[:page]).per(5)
  end

  def search
# binding.irb
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
    # @post = Post.find(params[:id])
    # @comment = Comment.new #①
    # @comments = @post.comments #②
    @comments = @post.comments
    @comment = @post.comments.build
  end

  def update
    if @post.user.id == current_user.id
      @post.update(post_params)
      redirect_to posts_path
      flash[:success] = "Profile has been successfully updated!"
    else
      render 'edit'
    end
  end

  def destroy
    if @post.user.id == current_user.id
      @post.destroy
      redirect_to posts_path
    else
      render "edit"
    end
  end


  def new
    @post = Post.new
  end

  private
  def set_post
    # binding.irb
    @post = Post.find(params[:id])
  end

  def set_q
    @q = Post.ransack(params[:q])
  end

  def post_params
    params.require(:post).permit(:title, :content, :image, :address, :image_cash, :user_id, :latitude, :longitude)
  end
end
