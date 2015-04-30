Rails.application.routes.draw do

  root "welcome#index"

  resources :golf_courses

  resources :games

end
