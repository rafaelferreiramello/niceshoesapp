Rails.application.routes.draw do
  root to: "shoes#index"
  resources :shoes
  devise_for :users
  resources :transactions, only: [:create]
  get "checkout/success", to: "transactions#success"
  get "checkout/cancel", to: "transactions#cancel"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
