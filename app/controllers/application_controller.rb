class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!, :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    if user_signed_in?

    end
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :remember_me, :password_confirmation) }
    devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:name, :email, :password, :remember_me) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :address, :address2, :city, :state, :country, :zipcode, :phone, :password, :password_confirmation, :current_password) }
  end

end
