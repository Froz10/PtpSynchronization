Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users, controllers: { registrations: 'users/registrations' }
  root 'home#index'

  resources :hosts do
    collection do
      get :search
    end
  end

  namespace :api, defaults: { format: 'json' } do
    resources :configurations, only: :create
  end
end
