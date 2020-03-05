Rails.application.routes.draw do
  resources :order_items, only: [:create, :destroy]
  resources :orders
  resources :carts
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', edit: 'profile', password: 'secret', confirmation: 'confirmations', unlock: 'unblock', registration: 'register', sign_up: ''},
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'registrations', sessions: 'users/sessions' }

  root 'pages#home', as: :root
  get 'login/create', to: 'logins#create', as: :create_login

  resources :users do
    member do
      post :enable_multi_factor_authentication, to: 'users/multi_factor_authentication#verify_enable'
      post :disable_multi_factor_authentication, to: 'users/multi_factor_authentication#verify_disabled'
    end
  end

  # concern :paginatable do
  #   get '(page/:page)', :action => :index, :on => :collection, :as => ''
  # end

  # concern :paging_category do
  #   get '(/:id/page/:page)', :action => :show, :on => :collection, :as => ''
  # end

  # resources :categories, :concerns => :paging_category do
  #   resources :products
  # end

  resources :categories do
    resources :products
  end

  # resources :products, :concerns => :paginatable

  get 'check-user' => 'users#check_user'
  
  #search
  post 'products/search' => 'products#search', as: :products_search

  # sort
  post '/products/sort/price-up' => 'products#price_up', as: :products_sort_up
  post '/products/sort/price-down' => 'products#price_down', as: :products_sort_down

  post '/order_items/up/:id' => 'order_items#increment_quantity'
  post '/order_items/down/:id' => 'order_items#decrement_quantity'

  post '/carts/send_confirm_order' => 'carts#send_confirm_order', as: :cart_send_confirm_order

  get '/cart-confirm-auth' => 'carts#confirm_auth', as: :confirm_auth
  get '/cart-confirm-email' => 'carts#confirm_email'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
