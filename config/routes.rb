Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :pages, only: [:show], param: :title

  root "home#index"
  resources :products, only: [:index, :show]
end
