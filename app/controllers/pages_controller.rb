class PagesController < ApplicationController
  def index
    if current_user
      @addresses = current_user.addresses
    end
  end
end