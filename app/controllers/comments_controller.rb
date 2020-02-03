class CommentsController < ApplicationController
  before_action :set_comment, only: :destroy

  def index
    @comments = Comment.includes(:emotes).all
  end

  def create
    @comment = current_user.comments.new(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to comments_path, notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_url, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_comment
    @comment = current_user.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
