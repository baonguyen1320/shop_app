Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', edit: 'profile', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: '' }

  root 'pages#home', as: :root
  resources :users
  resources :categories do
    resources :products
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
