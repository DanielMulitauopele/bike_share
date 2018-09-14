Rails.application.routes.draw do

  root 'welcome#index'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  get '/bike-shop' => 'accessories#index'

  get '/dashboard' => 'users#dashboard'
  get '/trips-dashboard' => 'trips#dashboard'
  get '/stations-dashboard' => 'stations#dashboard'
  get '/conditions-dashboard' => 'conditions#dashboard'

  delete '/carts' => 'carts#destroy'
  post '/carts' => 'carts#create'
  put '/carts' => 'carts#update'

  resources :users, only: [:new, :create, :edit, :update]
  resources :orders, only: [:show, :create, :edit, :update]
  resources :carts, only: [:create, :index]
  resources :stations, only: [:index]
  resources :trips, only: [:index, :show]
  resources :conditions, only: [:index, :show]
	resources :accessories, only: :show

  namespace :admin do
    resources :stations, except: [:index, :show]
    resources :trips, except: [:index, :show]
    resources :conditions, except: [:index, :show]
    get '/dashboard' => 'users#dashboard'
  end

   get '/:id', to: 'stations#show', as: :station
end
