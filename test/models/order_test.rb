# == Schema Information
#
# Table name: orders
#
#  id           :bigint           not null, primary key
#  order_number :string
#  payment_type :string
#  shipping_fee :decimal(8, 2)    default("0")
#  status       :string
#  tax_fee      :decimal(8, 2)    default("0")
#  token_key    :string
#  total        :decimal(8, 2)    default("0")
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :bigint
#
# Indexes
#
#  index_orders_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
