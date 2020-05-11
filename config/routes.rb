Rails.application.routes.draw do
 


  #root 'application#index'

  root to: 'application#index'
  devise_for :users
  #resources :users, only: [:show]
  resources :users do
    resources :game_scores, only: [:new, :create, :index]
  end
  resources :game_scores
  resources :game_tables
  
  
  
  
end
