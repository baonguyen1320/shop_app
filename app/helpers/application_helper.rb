module ApplicationHelper
  require 'uri'
  require 'barby'
  require 'barby/barcode'
  require 'barby/barcode/qr_code'
  require 'barby/outputter/png_outputter'

  def avatar_url(user)
    user.image || gravatar(user)
  end

  def generate_qr(text)
    barcode = Barby::QrCode.new(text, level: :h, size: 10)
    base64_output = Base64.encode64(barcode.to_png({xdim: 10}))
    "data:image/png;base64,#{base64_output}"
  end

  private
  def gravatar(user)
    global_avatar_id = Digest::MD5::hexdigest(user.email).downcase
    "https://www.gravatar.com/avatar/#{global_avatar_id}.jpg?d=identicon&s=350"
  end
end
