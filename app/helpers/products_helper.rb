module ProductsHelper

  def percent_sale_off(product)
    percent = ((product.older_price - product.price) * 100 / product.older_price).to_i
    'Save ' + percent.to_s + '%'
  end
end
