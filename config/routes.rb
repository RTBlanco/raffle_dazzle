Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  root "application#home"
  
  # get 'account/:username', to: 'raffles#account'
  get 'browse', to: 'raffles#browse'
  get 'my_raffles', to: 'raffles#index'
  

  resources :raffles, only: [:create, :new, :edit, :update, :show]

  
  resources :users, path: 'account', controller: 'users/users', only: [:show] do
    resources :raffle, only: [:show]
  end
  

  
  # resolve("User") {[:user]}
  # devise_for :users
  # devise_for :users, controllers: {sessions: 'users/sessions', registrations: 'users/registrations'}

  # devise_scope :user do 
  #   get 'login', to: 'user/sessions#create'
  #   get 'sign_up', to: 'user/registrations#create'
  # end
  
  devise_for :users, path_names: { sign_in: "login", sign_out: 'logout'},
              controllers: {sessions: 'users/sessions', registrations: 'users/registrations'}
              # path: 'accounts', singular: :account
  
end
