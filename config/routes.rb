Rails.application.routes.draw do

  root 'welcome#index'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  resources :users, only: [:new, :create]
  resources :carts, only: [:create, :index]
  resources :stations, only: [:show, :index]
  resources :trips, only: [:index, :show]
  resources :conditions, only: [:index, :show]
	resources :accessories, only: :show
  resources :orders, only: [:show]

  delete '/carts', to: 'carts#destroy'
  post '/carts', to: 'carts#create'
  put '/carts', to: 'carts#update'

  get '/bike-shop', to: 'accessories#index'
  get '/dashboard', to: 'users#dashboard'
end
