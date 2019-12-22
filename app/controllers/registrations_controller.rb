class RegistrationsController < Devise::RegistrationsController
  def new
  end

  def create
    # build_resource(sign_up_params)
    # if verify_recaptcha(model: resource) && resource.save
    #   yield resource if block_given?
    #   if resource.persisted?
    #     if resource.active_for_authentication?
    #       set_flash_message! :notice, :signed_up
    #       sign_up(resource_name, resource)
    #       respond_with resource, location: after_sign_up_path_for(resource)
    #     else
    #       set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
    #       expire_data_after_sign_in!
    #       respond_with resource, location: after_inactive_sign_up_path_for(resource)
    #     end
    #   else
    #     clean_up_passwords resource
    #     set_minimum_password_length
    #     respond_with resource
    #   end
    # else
    #   clean_up_passwords resource
    #   set_minimum_password_length
    #   respond_with resource
    # end
  end

  # private
  # def sign_up_params
  #   params.require(:user).permit(:name, :email, :password, :password_confirmation, :remember_me)
  # end

  # def set_flash_message!(key, kind, options = {})
  #   if is_flashing_format?
  #     set_flash_message(key, kind, options)
  #   end
  # end
end