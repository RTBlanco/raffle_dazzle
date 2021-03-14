Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  root "application#home"
  
  get 'home', to: 'raffles#home', as: :home
  get 'browse', to: 'raffles#browse', as: :browse
  get 'show', to: 'raffles#show', as: :show


  resources :raffles, only: [:create, :new]
  # resource :user, only: [:home, :browse]
  # resolve("User") {[:user]}
  # devise_for :users
  # devise_for :users, controllers: {sessions: 'users/sessions', registrations: 'users/registrations'}

  # devise_scope :user do 
  #   get 'login', to: 'user/sessions#create'
  #   get 'sign_up', to: 'user/registrations#create'
  # end
  
  devise_for :users, path_names: { sign_in: "login", sign_out: 'logout'},
              controllers: {sessions: 'users/sessions', registrations: 'users/registrations'}
  
end
