Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  require 'sidekiq/web'
  mount Rswag::Api::Engine => '/api-docs'
  mount Sidekiq::Web => '/sidekiq'
  resources :stores 
  resources :stockitems
  resources :products
end
