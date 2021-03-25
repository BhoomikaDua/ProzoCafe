Rails.application.routes.draw do
  get "/" => "home#index"

  resources :categories
  resources :invoices
  resources :users
  resources :menuitems, path: '/categories/menuitem'
  resources :report

  get "/cart" => "invoices#cart", as: :cart
  put "/deliver/:id" => "invoices#deliver", as: :deliver

  get "/signin" => "sessions#new", as: :new_sessions
  post "/signin" => "sessions#create", as: :sessions
  delete "/signout" => "sessions#destroy", as: :destroy_session
end
