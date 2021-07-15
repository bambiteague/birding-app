Rails.application.routes.draw do
  root "sessions#home"

  get '/auth/:provider/callback' => 'sessions#omniauth'

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  get '/logout' => 'sessions#destroy'
  delete '/logout' => 'sessions#destroy'

  
end
