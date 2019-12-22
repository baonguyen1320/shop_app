# app/controllers/logins_controller.rb
class LoginsController < ApplicationController
  def new
  end

  def create
    acc_google = GoogleSignIn::Identity.new(flash[:google_sign_in_token])
    @user = User.find_for_google_oauth2('google', acc_google.user_id, acc_google.name, acc_google.email_address, acc_google.avatar_url)
    if @user.persisted?
      flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', :kind => 'Google'
      sign_in_and_redirect @user, event: :authentication
    else
      session['devise.google_data'] = request.env['omniauth.auth'].except(:extra)
      redirect_to new_user_registration_url
    end
  end
end