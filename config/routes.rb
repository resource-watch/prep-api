Rails.application.routes.draw do

  # Active Admin routes
  get 'manager', to: 'manager/dashboards#index'
  ActiveAdmin.routes(self)

  # API endpoints
  namespace :api do

    jsonapi_resources :widgets
    jsonapi_resources :dashboards
    jsonapi_resources :indicators
    jsonapi_resources :insights
    jsonapi_resources :tools
    jsonapi_resources :partners
    jsonapi_resources :user_dashboards
    jsonapi_resources :resources
    resources :temporary_content_images, only: [:create]

  end

  # Auth
  get 'authentication/login', to: 'auth#login'
  get 'authentication/logout', to: 'auth#logout'

end
