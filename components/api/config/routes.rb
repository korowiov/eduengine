Api::Engine.routes.draw do
  resources :accounts, only: [:create]
  resources :sessions, only: [:create]
end
