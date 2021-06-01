Rails.application.routes.draw do
  get 'users/show'
  get 'tops/index'
  root "tops#index"
  resources :posts
  devise_for :users
  resources :users, only: [:show]

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
