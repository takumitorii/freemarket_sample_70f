Rails.application.routes.draw do
  devise_for :users
  root to: "tops#index"
  resources :users, only: [:show, :edit, :update, :destroy]
  resources :products
  resources :categories, only: [:index, :new, :create, :show]
  resources :card, only: [:new, :show] do
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end
  resources :purchase, only: [:index] do
    collection do
      get 'index', to: 'purchase#index'
      post 'pay', to: 'purchase#pay'
      get 'done', to: 'purchase#done'
    end
  end
end