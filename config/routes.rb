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

  resources :carts, only: [:create, :index]

  # log in page with form:
	get '/login'     => 'sessions#new'

	# create (post) action for when log in form is submitted:
	post '/login'    => 'sessions#create'

	# delete action to log out:
	delete '/logout' => 'sessions#destroy'

  get '/bike-shop', to: 'accessories#index'

end
