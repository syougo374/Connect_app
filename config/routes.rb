Rails.application.routes.draw do
  get 'tops/index'
  root "tops#index"
  resources :posts do 
    collection do
      get 'search'
    end
  end
  devise_for :users
  resources :users, only: [:show]

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
