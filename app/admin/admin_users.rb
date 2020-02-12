ActiveAdmin.register AdminUser do
  permit_params :email, :password, :password_confirmation, :otp_module

  index do
    selectable_column
    id_column
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  show do |t|
    attributes_table do
      row :email
      row :otp_secret_key do
        image_tag generate_qr(resource.provisioning_uri.gsub('otpauth://totp/', 'otpauth://totp/app_bao::'))
      end
      row :otp_module
    end
  end

  form do |f|
    f.inputs do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :otp_module
    end
    f.actions
  end

end
