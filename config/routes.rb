Rails.application.routes.draw do

  root 'welcome#index'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  
  get '/dashboard' => 'users#dashboard'

  resources :users, only: [:new, :create]

  resources :stations, only: [:show, :index]
  resources :trips, only: [:index, :show]
  resources :conditions, only: [:index, :show]
  resources :carts, only: [:create]

  resources :accessories, only: [:show]

  resources :carts, only: [:create, :index]

	resources :accessories, only: :show

  delete '/carts', to: 'carts#destroy'

  get '/bike-shop', to: 'accessories#index'

end
