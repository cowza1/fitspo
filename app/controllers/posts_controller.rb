class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  # def show
  #   @post = Post.find[:id]
  # end

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

  private

  def post_params
    params.require(:post).permit(:account, :content, :photo)
  end
end
