Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  root "application#home"
  
  get 'home', to: 'raffles#home', as: :home
  get 'browse', to: 'raffles#browse', as: :browse
  # resource :raffles, only: [:browse, :home]
  # resource :user, only: [:home, :browse]
  # resolve("User") {[:user]}
  # devise_for :users
  # devise_for :users, skip: :all #, controllers: {sessions: 'users/sessions'}
  
  

  devise_for :users, path_names: { sign_in: "login", sign_out: 'logout'},
              controllers: {sessions: 'users/sessions', registrations: 'users/registrations'}
  
end
