REDIS_URL = "redis://127.0.0.1:6379/12"

Sidekiq.configure_server do |config|
  config.redis = {
    url: REDIS_URL,
  }
end

Sidekiq.configure_client do |config|
  config.redis = {
    url: REDIS_URL,
  }
end
