Sidekiq.configure_server do |config|
  config.redis = { namespace: 'shop_sidekiq', url: 'redis://localhost:6379/2'}
end

Sidekiq.configure_client do |config|
  config.redis = { namespace: 'shop_sidekiq', url: 'redis://localhost:6379/2'}
end
