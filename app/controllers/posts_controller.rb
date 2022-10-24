class PostsController < ApplicationController
  def index
    @posts = Post.all
    @posts = Post.order("created_at DESC")
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.account = current_account if account_signed_in?
    if @post.save!
      redirect_to dashboard_path
    else
      redirect_to new_post_path
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(content: params[:post][:content])
    redirect_to dashboard_path
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      redirect_to profile_path(current_account.username), status: :see_other
    else
      render "post/show"
    end
  end

  private

  def post_params
    params.require(:post).permit(:account, :content, :photo)
  end
end
