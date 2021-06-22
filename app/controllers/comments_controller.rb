class CommentsController < ApplicationController
  before_action :authenticate_user!

  before_action :which_post?, only: [:create, :edit, :update, :destroy]
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(permitted_parameter)
    respond_to do |format|
      if @comment.save
        flash.now[:notice] = "コメントが投稿されました"
        format.js { render :index }
      else
        format.html { redirect_to post_path(@post),notice: '空では投稿できません' }
      end
    end
  end

  def edit
    @comment = @post.comments.find(params[:id])
    respond_to do |format|
      flash.now[:notice] = 'コメント編集中'
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
          flash.now[:notice] = 'コメントが編集されました'
        else
          flash.now[:notice] = 'コメントが空の為編集できませんでした'
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
      flash.now[:notice] = "コメントが削除されました"
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