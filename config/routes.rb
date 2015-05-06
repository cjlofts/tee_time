Rails.application.routes.draw do

  root "welcome#index"

  resources :golf_courses

  resources :games

  resources :requests
  resources :invitations

  resources :users
  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end

  resources :games, only: [:show] do
    resources :game_players
    resources :requests, only: [:create, :destroy]
    resources :invitations, only: [:create, :destroy]
  end

end
