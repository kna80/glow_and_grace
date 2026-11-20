Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root "products#index"

  resources :products, only: [:index, :show]
  resources :categories, only: [:index, :show]

  # Shopping Cart Routes
  get "/cart", to: "cart#index", as: :cart

  post "/cart/add", to: "cart#add", as: :add_to_cart

  patch "/cart/update", to: "cart#update", as: :update_cart

  delete "/cart/remove", to: "cart#remove", as: :remove_from_cart

  # Health Check
  get "up" => "rails/health#show", as: :rails_health_check

  # PWA Routes
  get "service-worker" => "rails/pwa#service_worker",
      as: :rails_pwa_service_worker

  get "manifest" => "rails/pwa#manifest",
      as: :rails_pwa_manifest
end