Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  root "application#home"
  
  get 'browse', to: 'raffles#browse'
  post 'enter/:id', to: 'raffles#enter', as: :enter
  patch 'funds', to: 'users/users#funds'

  get 'entered_raffles', to: 'raffles#entered'

  resources :raffles, only: [:create, :new, :edit, :update, :show, :destroy]

  
  resources :users, path: 'accounts', param: :username, controller: 'users/users', only: [:show] do
    resources :raffles, only: [:show, :index]
  end
  
  
  devise_for :users, path: 'account', path_names: { sign_in: "login", sign_out: 'logout'},
              controllers: {sessions: 'users/sessions',
                 registrations: 'users/registrations',
                 omniauth_callbacks: 'users/omniauth_callbacks'
                }
  
end
