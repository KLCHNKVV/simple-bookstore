Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :delete
  end

  get 'users/new', as: 'user_new'
  resources :users
  resources :orders
  resources :line_items
  resources :carts

  root 'store#index', as: 'store_index'

  resources :products do
    get :who_bought, on: :member
  end

  resources :users do
    member do
      get :confirm_email
    end
  end
end
