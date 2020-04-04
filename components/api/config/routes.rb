Api::Engine.routes.draw do
  resources :accounts, only: [:create]
  resources :resources, only: [:index]
  resource :session, only: %i[create destroy show]
  resources :subjects, only: [:index]
end
