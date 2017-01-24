class AddressesController < ApplicationController
  before_action :set_address, only: [:show, :edit, :update, :destroy]

  # GET /addresses/1
  # GET /addresses/1.json
  def show
    if !current_user || @address.user_id != current_user.id
      redirect_to errors_not_found_url
    end
  end

  # GET /addresses/new
  def new
    if current_user
      @address = Address.new
    else
      redirect_to errors_not_found_url
    end
  end

  # GET /addresses/1/edit
  def edit
    if !current_user || @address.user_id != current_user.id
      redirect_to errors_not_found_url
    end
  end

  # POST /addresses
  # POST /addresses.json
  def create
    if current_user
      @address = Address.new(address_params)
      @address.user_id = current_user.id

      respond_to do |format|
        if @address.save
          format.html { redirect_to @address, notice: 'Address was successfully created.' }
          format.json { render :show, status: :created, location: @address }
        else
          format.html { render :new }
          format.json { render json: @address.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /addresses/1
  # PATCH/PUT /addresses/1.json
  def update
    if current_user && @address.user_id == current_user.id
      respond_to do |format|
        if @address.update(address_params)
          format.html { redirect_to @address, notice: 'Address was successfully updated.' }
          format.json { render :show, status: :ok, location: @address }
        else
          format.html { render :edit }
          format.json { render json: @address.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /addresses/1
  # DELETE /addresses/1.json
  def destroy
    if current_user && @address.user_id == current_user.id
      @address.destroy
      respond_to do |format|
        format.html { redirect_to root_url, notice: 'Address was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_address
      @address = Address.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def address_params
      params.require(:address).permit(:user_id, :name, :address1, :address2, :zip_code, :city, :state, :country, :phone, :mobile, :email, :website, :other)
    end
end
