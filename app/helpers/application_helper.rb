module ApplicationHelper
  require 'uri'

  def avatar_url(user)
    global_avatar_id = Digest::MD5::hexdigest(user.email).downcase
    "https://www.gravatar.com/avatar/#{global_avatar_id}.jpg?d=identicon&s=350"
  end
end