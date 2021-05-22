Rails.application.routes.draw do
  root to: "shoes#index"
  resources :shoes
  devise_for :users
  # resources :transactions, only: [:create]
  post "/shoes/:id/checkout", to: "shoes#buy"
  get "checkout/success", to: "shoes#success"
  get "checkout/cancel", to: "shoes#cancel"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
