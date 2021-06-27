class CommentsController < ApplicationController
  before_action :authenticate_user!

  before_action :which_post?, only: [:create, :edit, :update, :destroy]
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(permitted_parameter)
    respond_to do |format|
      if @comment.save
        flash.now[:alert] = "コメントが投稿されました"
        format.js { render :index }
      else
        format.html { redirect_to post_path(@post),alert: '空では投稿できません' }
      end
    end
  end

  def edit
    @comment = @post.comments.find(params[:id])
    respond_to do |format|
      flash.now[:alert] = 'コメント編集中'
      format.js{ render :edit }
    end
  end

  def update
    @comment = @post.comments.find(params[:id])
    respond_to do |format|
      if @comment.valid?
        @comment.update(permitted_parameter)
        format.js { render :index}
        if @comment.valid?
          flash.now[:alert] = 'コメントが編集されました'
        else
          flash.now[:alert] = 'コメントが空の為編集できませんでした'
        end
      else
        format.js {render :edit}
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      flash.now[:alert] = "コメントが削除されました"
      format.js { render :index }
    end
  end

  private
  def which_post?
    @post = Post.find(params[:post_id])
  end

  def permitted_parameter
    params.require(:comment).permit(:post_id, :content).merge(user_id: current_user.id)
  end
end