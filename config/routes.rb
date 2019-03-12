Rails.application.routes.draw do
  root "static_pages#home"
  get "/help",      to: "static_pages#help"
  get "/show",      to: "static_pages#show"
  get "/cart",      to: "static_pages#cart"
  get "/signup",    to: "users#new"
  post "/signup",   to: "users#create"
  get "/login",     to: "sessions#new"
  post "/login",    to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  resources :users
  resources :categories, only: [:index]
  resources :carts, only: [:index]
  get "add_cart/:id_product", to: "carts#add_cart", as: :add_cart
  get "remove_cart/:id_product", to: "carts#remove_cart", as: :remove_cart
  put "update_hard_cart", to: "carts#update_hard_cart", as: :update_hard_cart

  namespace :admin do
    resources :categories
    resources :products
  end
end
