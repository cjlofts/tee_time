Rails.application.routes.draw do

  root "welcome#index"

  resources :golf_courses

  resources :games do
    # /games/created_by_me => games#created_by_me
    get :created_by_me, on: :collection
    get :requested_by_me, on: :collection
  end

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

  match "/delayed_job" => DelayedJobWeb, :anchor => false, via: [:get, :post]

end
