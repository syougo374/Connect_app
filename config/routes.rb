Rails.application.routes.draw do
  get 'relationships/create'
  get 'relationships/destroy'
  get 'tops/index'
  root "tops#index"
  resources :relationships, only: [:create, :destroy]
  resources :posts do
    collection do
      get 'search'
    end
  end
  devise_for :users
  resources :users, only: [:show, :index, :new ]

  # if Rails.env.development?
  #   mount LetterOpenerWeb::Engine, at: "/letter_opener"
  # end
end


