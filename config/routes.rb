Rails.application.routes.draw do
  root "static_pages#home"
  get "/help", to: "static_pages#help"
  get "/show", to: "static_pages#show"
  get "/cart", to: "static_pages#cart"
end
