class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items, dependent: :destroy
end

def send_receipt_email
  @user = User.find_by_email(self.user.email)
  @order = self

  # time = Time.now
  SendEmailOrderJob.perform_later(@user, @order) if @user.present?
end

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
