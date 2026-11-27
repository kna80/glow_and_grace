Rails.application.routes.draw do
    get "/about", to: "pages#show", defaults: { slug: "about" }, as: :about
get "/contact", to: "pages#show", defaults: { slug: "contact" }, as: :contact
  devise_for :customer_accounts
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root "products#index"

  resources :products, only: [:index, :show]
  resources :categories, only: [:index, :show]

  # Shopping Cart
  get "/cart", to: "cart#index", as: :cart
  post "/cart/add", to: "cart#add", as: :add_to_cart
  patch "/cart/update", to: "cart#update", as: :update_cart
  delete "/cart/remove", to: "cart#remove", as: :remove_from_cart

  # Checkout
  get "/checkout", to: "checkout#new", as: :checkout
  post "/checkout", to: "checkout#create", as: :place_order
  get "/orders/:id/confirmation",
      to: "checkout#show",
      as: :order_confirmation

  get "up" => "rails/health#show", as: :rails_health_check

  get "service-worker" => "rails/pwa#service_worker",
      as: :rails_pwa_service_worker

  get "manifest" => "rails/pwa#manifest",
      as: :rails_pwa_manifest
end