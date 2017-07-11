Rails.application.routes.draw do

  # Active Admin routes
  # devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # API endpoints
  namespace :api do
    resources :widgets
    resources :insights
    resources :dashboards
    resources :partners
    resources :indicators
    resources :tools
  end

  # Homepage
  root 'admin/home#index'

  # Auth
  get 'auth/login', to: 'auth#login'
  get 'auth/logout', to: 'auth#logout'

end
