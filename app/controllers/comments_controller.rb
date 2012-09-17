class CommentsController < ApplicationController
  def softdelete
    @comment = Comment.find(params[:id])
    @comment.toggle!(:visible)
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Comment invisible' }
    end
  end
end
