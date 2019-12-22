class PagesController < ApplicationController
  def home
    # flash[:google_sign_in][:id_token]
    @products = Product.all.order('id desc')
  end
end
