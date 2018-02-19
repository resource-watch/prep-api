Rails.application.routes.draw do

  # Active Admin routes
  get 'manager', to: 'manager/dashboards#index'
  ActiveAdmin.routes(self)

  # API endpoints
  namespace :api do
    resources :widgets
    resources :dashboards
    resources :indicators
    resources :insights
    resources :tools
    resources :partners
    resources :user_dashboards
    resources :resources
    resources :temporary_content_images, only: [:create]
    resources :profiles, only: [:show, :create, :update, :destroy]
  end

  # Auth
  get 'authentication/login', to: 'auth#login'
  get 'authentication/logout', to: 'auth#logout'

end
