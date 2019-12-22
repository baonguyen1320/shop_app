Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', edit: 'profile', password: 'secret', confirmation: 'confirmations', unlock: 'unblock', registration: 'register', sign_up: ''},
    controller: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'registrations' }

  root 'pages#home', as: :root
  get 'login/create', to: 'logins#create', as: :create_login
  resources :users
  resources :categories do
    resources :products
  end

  get 'check-user' => 'users#check_user'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
