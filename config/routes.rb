Rails.application.routes.draw do
  get "/" => "home#index"

  resources :category
  resources :invoice
  resources :user
  resources :menuitem, path: '/category/menuitem'

  get "/cart" => "invoice#cart", as: :cart

  get "/signin" => "sessions#new", as: :new_sessions
  post "/signin" => "sessions#create", as: :sessions
  delete "/signout" => "sessions#destroy", as: :destroy_session
end
