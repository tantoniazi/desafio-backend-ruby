Rails.application.routes.draw do
  mount Rswag::Api::Engine => '/api-docs'
  resources :stores do 
    resources :stockitems
  end
  resources :products
end
