Rails.application.routes.draw do
 
  resources :users
  resources :game_scores
  resources :game_tables do
    resources :game_scores, only: [:new, :create, :index]
  end

  root 'sessions#new'
  get '/register' => 'users#new'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  
  
end
