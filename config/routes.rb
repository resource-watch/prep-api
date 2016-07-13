Rails.application.routes.draw do

  # Active Admin routes
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # API endpoints
  namespace :api do
    resources :widgets, param: :slug
    resources :insights, param: :slug
    resources :dashboards, param: :slug
  end

  # Proxy to use iframe
  get 'proxy', to:'proxy#index', as: 'proxy'

  # Homepage
  root 'admin/home#index'

end
