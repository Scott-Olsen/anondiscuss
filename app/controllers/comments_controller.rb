class CommentsController < ApplicationController
  def softdelete
    @comment = Comment.find(params[:id])
    @comment.toggle!(:visible)
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Comment invisible' }
    end
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(params:comment)
    respond_to do |format|
      format.html { redirect_to post_path(@post), notice: 'Comment Posted' }
      format.js
    end
  end
end
