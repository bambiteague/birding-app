Rails.application.routes.draw do
  get '/sightings/most_recent' => 'sightings#most_recent'

  root "sessions#home"

  get '/auth/:provider/callback' => 'sessions#omniauth'

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  get '/logout' => 'sessions#destroy'
  delete '/logout' => 'sessions#destroy'

  get '/complete' => 'users#complete'
  post '/complete' => 'users#complete'

  resources :sessions, only: [:new, :create, :destroy]
  resources :sightings
  resources :birds
  
  resources :birds do 
    resources :sightings, only: [:new, :create, :index, :show]
  end

  resources :users, only: [:new, :create, :show] do 
    collection do
      get "my_sightings"
    end
  end

end
