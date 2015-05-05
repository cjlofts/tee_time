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
    resources :requests, only: [:create]
    resources :invitations, only: [:create]
  end

end
