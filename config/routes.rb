Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root "products#index"

  resources :products, only: [:index, :show]
  resources :categories, only: [:index, :show]

  get "up" => "rails/health#show", as: :rails_health_check

  get "service-worker" => "rails/pwa#service_worker", as: :rails_pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :rails_pwa_manifest
end