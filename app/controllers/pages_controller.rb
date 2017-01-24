class PagesController < ApplicationController
  def index
    if current_user
      @addresses = current_user.addresses.sort { |p1, p2| p1.name.downcase <=> p2.name.downcase }
    end
  end
end