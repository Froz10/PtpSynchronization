Rails.application.routes.draw do
  devise_for :import_hosts_to_dbs, ActiveAdmin::Devise.config
  devise_for :admin_users, ActiveAdmin::Devise.config

  devise_for :users, controllers: { registrations: 'users/registrations' }
  root 'home#index'
  resources :hosts
end
