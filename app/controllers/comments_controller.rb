class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    @comment.post = @post

    respond_to do |format|
      if @comment.save
        format.html { redirect_to post_path(@post) }
        format.json
      else
        format.html { render post_path, status: :unprocessable_entity }
        format.json
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to dashboard_path
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
