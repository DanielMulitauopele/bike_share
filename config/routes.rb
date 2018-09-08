Rails.application.routes.draw do
  root 'welcome#index'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  resources :stations

  resources :trips, only: [:index, :show]

  resources :conditions, only: [:index]

end
