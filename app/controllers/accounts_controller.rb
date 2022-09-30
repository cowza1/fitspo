class AccountsController < ApplicationController
  before_action :authenticate_account!

  def index
    @posts = Post.all
  end

  def show
    # @account = Account.find(params[:id])
    @account = Account.find_by(username: params[:username])
    @posts = Post.where(params[:account_id])
  end
end
