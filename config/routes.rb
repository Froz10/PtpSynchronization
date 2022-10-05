Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users, controllers: { registrations: 'users/registrations' }
  root 'home#index'
  resources :hosts

  namespace :api do
    resources :configurations, only: :create
  end
end
