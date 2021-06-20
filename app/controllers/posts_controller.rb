class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy ]
  before_action :authenticate_user!
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
    # binding.irb
    @post = current_user.posts.build(post_params)
    # binding.irb
    if @post.save
      redirect_to posts_path, notice: '新規投稿しました'
    else
      # redirect_back(fallback_location: new_post_path)
      render 'new', notice: '投稿に失敗しました'
    end
  end

  def edit
  end

  def show
    @favorite = current_user.favorites.find_by(post_id: @post.id)
    @comments = @post.comments
    @comment = @post.comments.build
    # binding.irb
  end

  def update
    if @post.user.id == current_user.id
      @post.update(post_params)
      redirect_to post_path(@post), notice: '投稿を編集しました'
    else
      render 'edit'
    end
  end

  def destroy
    if @post.user.id == current_user.id
      @post.destroy
      redirect_to posts_path, notice: '投稿を削除しました'
    else
      render "edit"
    end
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
    params.require(:post).permit(:title, :content, :image, :image_cache, :address,  :user_id, :latitude, :longitude)
  end
end
