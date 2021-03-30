Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  root "application#home"
  
  get 'browse', to: 'raffles#browse'
  post 'browse', to: 'raffles#browse'
  patch 'funds', to: 'users/users#funds'
  
  
  resources :raffles, only: [:create, :new, :edit, :update, :show, :destroy] do 
    resources :entries, only: [:index, :new]
    post '/entry/', to: 'entries#create'
    get 'entered_users', to: 'entries#users'
    post 'winner', to: 'entries#winner'  
  end

  


  resources :users, path: 'accounts', param: :username, controller: 'users/users', only: [:show] do
    resources :raffles, only: [:show, :index, :new]
  end
  
  
  devise_for :users, path: 'account', path_names: { sign_in: "login", sign_out: 'logout'},
              controllers: {sessions: 'users/sessions',
                 registrations: 'users/registrations',
                 omniauth_callbacks: 'users/omniauth_callbacks'
                }
  
end
