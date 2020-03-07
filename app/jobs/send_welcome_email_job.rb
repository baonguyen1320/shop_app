class SendWelcomeEmailJob < ApplicationJob
  queue_as :default

  def perform(user)
    ShopMailer.to_user(user).deliver_later
  end
end
