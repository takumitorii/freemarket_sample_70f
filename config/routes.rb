Rails.application.routes.draw do
  devise_for :users
  root to: "tops#index"
  resources :users, only: [:show, :edit, :update, :destroy]
  resources :products
  resources :categories, only: [:index, :new, :create, :show]
end