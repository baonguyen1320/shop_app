CarrierWave.configure do |config|

  config.fog_credentials = {
      :provider => 'AWS',
      :aws_access_key_id => ENV['AWS_ACCESS_KEY_ID'],
      :aws_secret_access_key => ENV['AWS_SECRET_ACCESS_KEY'],
      :region => ENV['AWS_S3_REGION']
  }
  config.fog_directory = ENV['AWS_S3_BUCKET']

  config.cache_dir = "#{Rails.root}/tmp/uploads"
end
