class PagesController < ApplicationController
  def home
    @products = Product.all.order('id desc')
  end
end
