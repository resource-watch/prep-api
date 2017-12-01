Rails.application.routes.draw do

  # Active Admin routes
  get 'admin', to: 'admin/dashboards#index'
  ActiveAdmin.routes(self)
  # devise_for :admin_users, ActiveAdmin::Devise.config

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
  end

  # Homepage
  # root 'admin/home#index'

  # Auth
  get 'auth/login', to: 'auth#login'
  get 'auth/logout', to: 'auth#logout'

end
