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

  resources :sessions
  resources :sightings
  resources :users, only: [:new, :create]
  resources :birds do        
    resources :sightings, only: [:new, :index, :create]
  end
#   resources :users do 
#     resources :sightings    # <---- do I need this nested route?
#   end
end
