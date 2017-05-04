Rails.application.routes.draw do

  get 'auth/:provider/callback', to: 'connections#create'
  resources :connections, only: [:destroy]

  devise_for :users, controllers: {registrations: 'registrations'}
  root 'pages#home'
  get 'dashboard', to: 'pages#dashboard'

  get 'auth/failure', to: 'connections#omniauth_failure'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
