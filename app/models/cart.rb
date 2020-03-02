class Cart < ApplicationRecord
  has_many :order_items, dependent: :destroy

  def add_item(product_id)
    current_item = self.order_items.find_by(product_id: product_id)

    if current_item.present?
      current_item.quantity += 1
    else
      current_item = self.order_items.build(product_id: product_id)
    end

    current_item
  end

  def total_price
    order_items.to_a.sum { |item| item.total_price}
  end
end

# == Schema Information
#
# Table name: carts
#
#  id         :bigint           not null, primary key
#  email      :string
#  string     :string
#  tag        :string
#  token_key  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
