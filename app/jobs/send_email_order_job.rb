class SendEmailOrderJob < ApplicationJob
  queue_as :default

  def perform(user, order)
    ShopMailer.new_receipt(user, order).deliver_later(wait: 10.second)
  end
end
