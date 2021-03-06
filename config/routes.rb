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

  resources :users do
    member do
      resources :orders do
        resources :order_items, only: [:index]
      end
    end
  end
  resources :products do
    resources :orders
  end
  resources :categories, only: [:index, :show] do
    resources :products, only: [:index]
  end
  resources :carts, only: [:index]
  get "add_cart/:id_product", to: "carts#add_cart", as: :add_cart
  get "remove_cart/:id_product", to: "carts#remove_cart", as: :remove_cart
  put "update_hard_cart", to: "carts#update_hard_cart", as: :update_hard_cart
  put "orders/:id_order", to: "orders#cancel", as: :cancel
  put "approve/:id_order", to: "admin/orders#approve", as: :approve
  put "reject/:id_order", to: "admin/orders#reject", as: :reject
  post "products/search", to: "products#search", as: :search_product

  namespace :admin do
    resources :categories
    resources :products
    resources :orders do
      resources :order_items
    end
  end
end
