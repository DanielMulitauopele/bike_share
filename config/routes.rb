Rails.application.routes.draw do
  resources :stations

  resources :trips, only: [:index]

  resources :conditions, only: [:index]

end
