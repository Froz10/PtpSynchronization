Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users, controllers: { registrations: 'users/registrations' }
  root to: "home#index"

  resources :regions do
    resources :hosts
  end

  namespace :api, defaults: { format: 'json' } do
    resources :configurations do
      collection do
        get :search
      end
    end
    resources :synchronizations
  end
end
