Rails.application.routes.draw do

  # Active Admin routes
  # devise_for :admin_users, ActiveAdmin::Devise.config

  # API endpoints
  namespace :api do
    resources :widgets
    resources :dashboards
    resources :indicators
    resources :insights
    resources :tools
    resources :partners
  end

  # Homepage
  # root 'admin/home#index'

  # Auth
  get 'auth/login', to: 'auth#login'
  get 'auth/logout', to: 'auth#logout'

end
