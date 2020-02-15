Rails.application.routes.draw do
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

  resources :categories do
    resources :products
  end

  get 'check-user' => 'users#check_user'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
