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

  namespace :admin do
    resources :categories
    resources :products
  end
end
