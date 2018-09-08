Rails.application.routes.draw do

  root 'welcome#index'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  get '/dashboard' => 'users#dashboard'

  resources :users, only: [:new, :create]
  resources :stations, only: [:show, :index]
  resources :trips, only: [:index, :show]
  resources :conditions, only: [:index, :show]
  resources :carts, only: [:create]

  get '/bike-shop', to: 'accessories#index'


end
