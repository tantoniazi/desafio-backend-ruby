# config/initializers/sidekiq.rb
Sidekiq.configure_server do |config|
  config.redis = { url: 'redis://desafio-backend-ruby-redis:6379' }
end

Sidekiq.configure_client do |config|
  config.redis = { url: 'redis://desafio-backend-ruby-redis:6379' }
end