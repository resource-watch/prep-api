Rails.application.routes.draw do

  # Active Admin routes
  # devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # API endpoints
  namespace :api do
    resources :widgets, param: :slug
    resources :insights, param: :slug
    resources :dashboards, param: :slug
    resources :partners, param: :slug
    resources :indicators, param: :slug
    resources :tools, param: :slug
  end

  # Homepage
  root 'admin/home#index'

  # Auth
  get 'auth/login', to: 'auth#login'
  get 'auth/logout', to: 'auth#logout'

end
