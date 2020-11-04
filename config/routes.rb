Rails.application.routes.draw do
  devise_for :users
  root to: "boats#index"
  resources :boats do
    resources :comments, only: :create
  end
  resources :users, only: :show
end
