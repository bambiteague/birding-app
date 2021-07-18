Rails.application.routes.draw do

  root "sessions#home"

  get '/auth/:provider/callback' => 'sessions#omniauth'
  post '/auth/google_oauth2' => 'sessions#omniauth'

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  get '/logout' => 'sessions#destroy'
  delete '/logout' => 'sessions#destroy'

  get '/complete' => 'users#complete'
  post '/complete' => 'users#complete'

  resources :sessions, only: [:new, :create, :destroy]
  resources :sightings, only: [:show, :index, :destroy]
  resources :users, only: [:new, :create]
  resources :birds
  
  resources :users do 
    resources :sightings , only: [:new, :create, :index]
  end

end
