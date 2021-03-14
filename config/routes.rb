Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root "users#home"

  
  # get '/user/home/', to: "users#home"
  get '/user/browse/', to: "users#browse"
  # resource :user, only: [:home, :browse]
  # resolve("User") {[:user]}
  # devise_for :users
  # devise_for :users, skip: :all #, controllers: {sessions: 'users/sessions'}
  
  resources :users, only: [:home, :browse]

  devise_for :users, skip: [:confirmations, :mailers], skip_helpers: true,
             path_names: { sign_in: "login", sign_out: 'logout'},
             controllers:{ sessions: 'users/sessions', registrations: 'users/registrations'}
  
end
