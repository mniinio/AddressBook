class PagesController < ApplicationController
  def index
    if current_user
      @addresses = Address.all.mine(current_user.id)
      respond_to do |format|
        format.html
        format.csv { send_data @addresses.to_csv, filename: 'addresses.csv' }
      end
    end
  end
end