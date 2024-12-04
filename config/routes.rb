Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :pages, only: [:show], param: :title

  root "home#index"

  resources :products, only: [:index, :show]

  resources :categories, only: [:index, :show] do
    resources :products, only: [:index]
  end

  resources :cart, only: [:show] do
    post 'add_to_cart', on: :collection
    patch 'update_quantity', on: :collection
    delete 'remove_from_cart', on: :collection
  end
end
