Rails.application.routes.draw do
  get "/" => "home#index"

  resources :categories
  resources :invoices
  resources :users
  resources :menuitems, path: '/categories/menuitem'

  get "/cart" => "invoices#cart", as: :cart

  get "/signin" => "sessions#new", as: :new_sessions
  post "/signin" => "sessions#create", as: :sessions
  delete "/signout" => "sessions#destroy", as: :destroy_session
end
