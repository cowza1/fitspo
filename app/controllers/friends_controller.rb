class FriendsController < ApplicationController
  def index
    @accounts = Account.all
  end
end
