Rails.application.routes.draw do
  root to: "boats#index"
  resources :boats, only: :index
end
