class RegistrationsController < Devise::RegistrationsController
  def create
    build_resource(sign_up_params)
    if verify_recaptcha(model: resource)
      resource.skip_confirmation_notification!
      resource.save
      yield resource if block_given?
      if resource.persisted?
        set_flash_message! :notice, :signed_up
        # resource.update confirmed_at: Time.now
        # resource.skip_confirmation!
        sign_in(resource_name, resource)
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        clean_up_passwords resource
        set_minimum_password_length
        respond_with resource
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end
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