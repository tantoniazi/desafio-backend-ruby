Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Rswag::Api::Engine => '/api-docs'
  mount Sidekiq::Web => '/sidekiq'
  resources :stores 
  resources :stockitems
  resources :products
end
