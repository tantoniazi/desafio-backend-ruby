Rails.application.routes.draw do
  mount Rswag::Api::Engine => '/api-docs'
  resources :stores 
  resources :stockitems
  resources :products
end
