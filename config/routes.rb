Rails.application.routes.draw do

  # Active Admin routes
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/*path', to: 'home#index', as: :home

  root 'home#index'

end
