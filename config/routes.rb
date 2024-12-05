Rails.application.routes.draw do
  devise_for :customers
  get "orders/new"
  get "orders/create"
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :pages, only: [:show], param: :title

  root "home#index"

  resources :products, only: [:index, :show]

  resources :categories, only: [:index, :show] do
    resources :products, only: [:index]
  end

  resource :cart, only: [:show] do
    post :add_item
    patch :update_item
    delete :remove_item
    get :checkout
  end

  resources :orders, only: [:new, :create]

  devise_for :customers, controllers: {
  registrations: 'customers/registrations'
}
end
