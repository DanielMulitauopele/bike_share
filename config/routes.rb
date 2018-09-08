Rails.application.routes.draw do
  resources :stations
  resources :conditions, only: [:index, :show]
end
