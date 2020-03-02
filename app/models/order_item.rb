class OrderItem < ApplicationRecord
  belongs_to :product, optional: true
  belongs_to :cart
  belongs_to :order, optional: true

  def total_price
    product = Product.find(self.product.id)
    if product.present?
      product.price * quantity
    else
      0
    end
  end
end

# == Schema Information
#
# Table name: order_items
#
#  id         :bigint           not null, primary key
#  quantity   :integer          default("1")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  cart_id    :bigint
#  order_id   :bigint
#  product_id :bigint
#
# Indexes
#
#  index_order_items_on_cart_id     (cart_id)
#  index_order_items_on_order_id    (order_id)
#  index_order_items_on_product_id  (product_id)
#
# Foreign Keys
#
#  fk_rails_...  (cart_id => carts.id)
#  fk_rails_...  (order_id => orders.id)
#  fk_rails_...  (product_id => products.id)
#
