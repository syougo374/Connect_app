Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :admins
  resources :relationships, only: [:create,:destroy]
  post "favorites/:post_id/create" => "favorites#create"
  post "favorites/:post_id/destroy" => "favorites#destroy"
  get 'tops/index'
  root "tops#index"

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
    post 'users/admin_guest_sign_in', to: 'users/sessions#admin_guest_sign_in'
  end

  resources :conversations do
    resources :messages
  end

  resources :favorites, only: [:create, :destroy, :show]
  resources :relationships, only: [:create, :destroy]

  resources :posts do
    collection do
      get 'search'
    end
    resources :comments, only: [:create, :destroy,:edit, :update,:destroy]
  end

  # devise_for :admins, controllers: {
  #   sessions: "admins/sessins"
  # }
  # namespace :admins do
  #   resources :users, only: %i(index destroy)
  #   resources :questions, only: %i(index destroy)
  # end

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  resources :users, only: [:show] do
    member do
      get :following, :followers
    end
  end
end




