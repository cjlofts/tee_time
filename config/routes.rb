Rails.application.routes.draw do

  root "welcome#index"

  resources :golf_courses

  resources :games

  resources :users
  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end

end
