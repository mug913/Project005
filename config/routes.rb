Rails.application.routes.draw do
  
  resources :game_scores
  resources :game_tables
  root 'sessions#new'
  get '/register' => 'users#new'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  resources :users
  
end
