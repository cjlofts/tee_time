Rails.application.routes.draw do

  root "welcome#index"

  resources :golf_courses

  resources :games

  resources :requests do
    member do
      put :accept
      put :decline
    end
  end

  resources :invitations do
    member do
      put :accept
      put :decline
    end
  end

  resources :users
  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end

  resources :games, only: [:show] do
    resources :game_players
    resources :invitations
    resources :requests
  end

end
