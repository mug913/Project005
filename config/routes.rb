Rails.application.routes.draw do
 


  devise_for :admins, controllers: { omniauth_callbacks: 'admins/omniauth_callbacks' }
  devise_scope :admin do 
    get 'admins/sign_in', to: 'admins/sessions#new', as: :new_admin_session
    get 'admins/sign_out', to: 'admins/sessions#destroy', as: :destroy_admin_session
    get 'admins/sessions/dashboard', to: 'admins/sessions#dashboard', as: :admin_dashboard   end

  #root 'application#index'
  #root to: 'dashboards#show'
  
  # admin_root to: 'application#admin'
  root to: 'application#index'
  devise_for :users

  resources :users do
    resources :game_scores, only: [:new, :create, :index]
  end
  resources :game_scores
  resources :game_tables
  
  
  
  
end
