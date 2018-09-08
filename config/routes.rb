Rails.application.routes.draw do
  resources :stations
  resources :trips, only: [:index]
end
