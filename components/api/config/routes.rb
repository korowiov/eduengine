Api::Engine.routes.draw do
  resources :accounts, only: [:create]
  resources :resources, only: %i[index show]
  resource :session, only: %i[create destroy show]
  resources :subjects, only: [:index]

  namespace :resources do
    resources :flashcards_decks, only: [:show] do
      resources :flashcards, only: [:show]
    end
  end 
end
