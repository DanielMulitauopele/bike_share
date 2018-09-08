Rails.application.routes.draw do
  
  root 'welcome#index'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  get '/dashboard' => 'users#dashboard'
  
  resources :users, only: [:new, :create]
  
  resources :stations, only: [:show, :index]

  resources :trips, only: [:index]

  resources :conditions, only: [:index]

end
