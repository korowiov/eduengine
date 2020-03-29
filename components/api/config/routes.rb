Api::Engine.routes.draw do
  resources :accounts, only: [:create]
  resources :resources, only: [:index]
  resources :sessions, only: [:create]
  resources :subjects, only: [:index]
end
