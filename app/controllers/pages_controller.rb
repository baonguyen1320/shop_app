class PagesController < ApplicationController
  require 'will_paginate/array'
  include CurrentCart
  before_action :set_cart

  def home
    # flash[:google_sign_in][:id_token]
    @products = Product.all.order('id desc')
    @products = @products.paginate(page: params[:page], per_page: 8)
  end
end
