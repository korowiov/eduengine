Api::Engine.routes.draw do
  resources :accounts, only: [:create]
end
