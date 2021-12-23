Rails.application.routes.draw do
  resources :products
  devise_for :users
  get '/convert_currency',to: "products#convert_currency"
  root to: 'products#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
