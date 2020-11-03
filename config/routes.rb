Rails.application.routes.draw do
  devise_for :users
  root to: "boats#index"
  resources :users, only: :show
end
