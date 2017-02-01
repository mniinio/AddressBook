class UsersController < ApplicationController
  before_action :set_status, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
   @users = User.all
   respond_to do |format|
     format.html
   end
 end

  # GET /users/1
  # GET /users/1.json
  def show
    if !current_user || @user.user_id != current_user.id
      redirect_to errors_not_found_url
    end
  end

  # GET /users/new
  def new
    if current_user
      @user = User.new
    else
      redirect_to errors_not_found_url
    end
  end

  # GET /users/1/edit
  def edit
    if !current_user || @user.user_id != current_user.id
      redirect_to errors_not_found_url
    end
  end

  # POST /users
  # POST /users.json
  def create
    if current_user
      @user = User.new(address_params)
      @user.user_id = current_user.id

      respond_to do |format|
        if @user.save
          format.html { redirect_to @user, notice: 'User was successfully created.' }
          format.json { render :show, status: :created, location: @user }
        else
          format.html { render :new }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    if current_user && @user.user_id == current_user.id
      @user.destroy
      respond_to do |format|
        format.html { redirect_to root_url, notice: 'User was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_address
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:address).permit(:user_id, :name, :address1, :address2, :zip_code, :city, :state, :country, :phone, :mobile, :email, :website, :other)
    end
end
