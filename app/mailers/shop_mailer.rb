class ShopMailer < ApplicationMailer
  default from: 'Shop App <baonguyen1103spkt@gmail.com>'

  def to_user(user)
    @user = user
    subject = 'Welcome to the shop app'
    to = user.email
    mail(to: to, subject: subject)
  end

  def new_receipt(user, order)
    @user = user
    @order = order
    subject = 'this is test job send email'

    mail(to: @user.email, subject: subject)
  end
end