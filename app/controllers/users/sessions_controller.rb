class Users::SessionsController < Devise::SessionsController

  # GET /users
  def index
   @user = current_user
   if @user.superuser?
      @users = User.all
   else 
      redirect_to errors_not_found_url
   end
  end

  # GET /users/superuser
  # TODO: This is stupid of course, user can set themselves as superuser, but fast solution
  def superuser
    current_user.update_attribute :superuser, true
  end

# before_action :configure_sign_in_params, only: [:create]

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
