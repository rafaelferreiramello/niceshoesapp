Rails.application.routes.draw do
  
  root to: "shoes#index"
  resources :shoes

  resources :blogs

  devise_for :users

  post "checkout/buy", to: "checkout#buy"
  get "checkout/success", to: "checkout#success"
  get "checkout/cancel", to: "checkout#cancel"
  
  post "shoes/add_to_cart/:id", to: "shoes#add_to_cart", as: "add_to_cart"
  delete "shoes/remove_from_cart/:id", to: "shoes#remove_from_cart", as: "remove_from_cart"

end
