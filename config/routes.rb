Rails.application.routes.draw do
  root to: 'tasks#index'

  get '/login', to: 'sessions#new', as: :login
  post '/authenticate', to: 'sessions#create', as: :authenticate
  delete '/logout', to: 'sessions#destroy', as: :logout
  get '/signup', to: 'users#signup', as: :signup

  post '/users', to: 'users#register', as: :register

  resources :users, only: %i[new create]
  resources :tasks, except: :show
end
