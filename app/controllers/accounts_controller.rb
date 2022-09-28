class AccountsController < ApplicationController
  before_action :authenticate_account!

  def index
    @posts = current_account.posts
  end

  def show
    # user profile
  end
end
