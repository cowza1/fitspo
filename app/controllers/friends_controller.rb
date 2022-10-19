class FriendsController < ApplicationController
  def index
    @accounts = Account.all
  end

  def show
    @feed = current_account.following
  end
end
