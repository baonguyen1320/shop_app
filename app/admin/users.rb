ActiveAdmin.register User do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :name, :address, :address2, :city, :state, :country, :zipcode, :phone, :language, :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :provider, :uid, :image, :confirmation_token, :confirmed_at, :confirmation_sent_at, :failed_attemps, :unlock_token, :locked_at, :otp_secret_key, :otp_module
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :address, :address2, :city, :state, :country, :zipcode, :phone, :language, :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :provider, :uid, :image, :confirmation_token, :confirmed_at, :confirmation_sent_at, :failed_attemps, :unlock_token, :locked_at, :otp_secret_key, :otp_module]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
