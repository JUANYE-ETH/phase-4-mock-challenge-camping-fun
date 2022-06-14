Rails.application.routes.draw do
  resources :campers, only: [:index, :show, :create]
  resources :signups, only: [:index, :show, :create]
  resources :activities, only: [:index, :show, :destroy]
end
