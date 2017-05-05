Rails.application.routes.draw do

  authenticate :user, -> user {user.admin?} do
    mount Delayed::Web::Engine, at: '/jobs'
  end
  get 'auth/:provider/callback', to: 'connections#create'
  resources :connections, only: [:destroy]
  resources :posts do
    member do
      put :cancel
    end
  end

  devise_for :users, controllers: {registrations: 'registrations'}
  root 'pages#home'
  get 'dashboard', to: 'pages#dashboard'

  get 'auth/failure', to: 'connections#omniauth_failure'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
