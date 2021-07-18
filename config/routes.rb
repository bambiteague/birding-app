Rails.application.routes.draw do
  root "sessions#home"

  get '/auth/:provider/callback' => 'sessions#omniauth'
  #wanted a post route? didn't need one last project for Oauth to work

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
  resources :users

  #  Still need to do a lot of tweaking on the nested routes below
  resources :birds do         # Impliment shallow nesting
    resources :sightings
  end
#   resources :users do 
#     resources :sightings    # <---- do I need this nested route?
#   end
end
