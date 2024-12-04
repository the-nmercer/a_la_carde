Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :pages, only: [:show], param: :title

  root "home#index"

  resources :products, only: [:index, :show]

  resources :categories, only: [:index, :show] do
    resources :products, only: [:index]
  end

  resources :cart, only: [:index, :create, :update, :destroy] do
    collection do
      post 'add_to_cart'
      post 'update_quantity'
      delete 'remove_from_cart', to: 'cart#remove_from_cart'
      get 'checkout'
    end
  end
end
