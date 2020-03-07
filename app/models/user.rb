class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :timeoutable, :omniauthable

  has_many :orders, dependent: :destroy
         
  # verify 2 factor
  has_one_time_password
  enum otp_module: { disabled: 0, enabled: 1 }, _prefix: true
  attr_accessor :otp_code_token

  validates :name, presence: true, length: { minimum: 3, maximum: 25 }

  after_create :send_email_welcome

  def send_email_welcome
    SendWelcomeEmailJob.perform_later(self)
  end

  def self.find_for_google_oauth2(provider, uid, name, email, avatar)
    user = User.where(:provider => provider, :uid => uid).first
    if user
      user.skip_confirmation!
      user.skip_confirmation_notification!
      user.save
      return user
    else
      registered_user = User.where(:email => email).first
      if registered_user
        registered_user.skip_confirmation!
        registered_user.skip_confirmation_notification!
        registered_user.save
        return registered_user
      else
        user = User.new(
            name: name,
            provider: provider,
            email: email,
            uid: uid,
            image: avatar,
            password: Devise.friendly_token[0, 20]
        )
        user.skip_confirmation!
        user.skip_confirmation_notification!
        user.save
        return user
      end
    end
  end

  # def self.find_for_facebook_oauth(provider, uid, name, email, signed_in_resource = nil)
  #   user = User.where(:provider => provider, :uid => uid).first

  #   if user
  #     user.skip_confirmation!
  #     user.skip_confirmation_notification!
  #     user.save
  #     return user
  #   else
  #     registered_user = User.where(:email => email).first
  #     if registered_user
  #       registered_user.skip_confirmation!
  #       registered_user.skip_confirmation_notification!
  #       registered_user.save
  #       return registered_user
  #     else
  #       user = User.new(
  #           name: name,
  #           provider: provider,
  #           email: email,
  #           uid: uid,
  #           password: Devise.friendly_token[0, 20]
  #       )
  #       user.skip_confirmation!
  #       user.skip_confirmation_notification!
  #       user.save
  #       return user
  #     end
  #   end
  # end
end

# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  address                :string
#  address2               :string
#  city                   :string
#  confirmation_sent_at   :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  country                :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  failed_attemps         :integer          default("0")
#  image                  :string
#  language               :string
#  locked_at              :datetime
#  name                   :string
#  otp_module             :integer          default("0")
#  otp_secret_key         :string
#  phone                  :string
#  provider               :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  state                  :string
#  uid                    :string
#  unlock_token           :string
#  zipcode                :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
