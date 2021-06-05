Rails.application.routes.draw do
  resources :relationships, only: [:create,:destroy]
  post "favorites/:post_id/create" => "favorites#create"
  post "favorites/:post_id/destroy" => "favorites#destroy"
  get 'tops/index'
  root "tops#index"
  resources :favorites, only: [:create, :destroy, :show]
  resources :relationships, only: [:create, :destroy]
  resources :posts do
    collection do
      get 'search'
    end
  end
  devise_for :users
  resources :users, only: [:show] do
    member do
      get :following, :followers
    end
  end
end




