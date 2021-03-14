Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  root "home#index"
  

  
  get '/user/home/', to: "home#home"
  get '/user/browse/', to: "home#browse"
  # resource :user, only: [:home, :browse]
  # resolve("User") {[:user]}
  # devise_for :users
  # devise_for :users, skip: :all #, controllers: {sessions: 'users/sessions'}
  
  

  devise_for :users, skip: [:confirmations, :mailers], skip_helpers: true,
             path_names: { sign_in: "login", sign_out: 'logout'},
             controllers:{ sessions: 'users/sessions', registrations: 'users/registrations'}
  
end
