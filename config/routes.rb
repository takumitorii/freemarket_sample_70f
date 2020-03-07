Rails.application.routes.draw do
  devise_for :users
  root to: "tops#index"
  resources :users, only: :show
  resources :products, only: [:index, :new, :show]
end