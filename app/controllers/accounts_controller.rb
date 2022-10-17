class AccountsController < ApplicationController
  before_action :authenticate_account!
  before_action :set_account, only: %i[follow unfollow]

  def index
    @accounts = Account.where.not(id: current_account.id)
    @posts = Post.all
    @posts = Post.order("created_at DESC")
  end

  def show
    @account = Account.find_by(username: params[:username])
    @posts = Post.where(params[:account_id])
  end

  def follow
    if current_account.follow(@account.id)
      respond_to do |format|
        format.html { redirect_to accounts_path(@account) }
        format.js
      end
    else
      redirect_to root_path
    end
  end

  def unfollow
    if current_account.unfollow(@account.id)
      respond_to do |format|
        format.html { redirect_to accounts_path(@account) }
        format.js { render action: :follow }
      end
    end
  end

  def edit
    @account = Account.find_by(username: params[:username])
    @account = current_account
  end

  private

  def set_account
    @account = Account.find(params[:id])
  end
end
