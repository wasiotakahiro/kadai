Rails.application.routes.draw do
  resources :feeds
  resources :contacts
  resources :sessions, only: [:new, :create, :destroy]
  resources :favorites, only: [:create, :destroy]
    resources :users
    mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  resources :blogs do
    collection do
      post :confirm
    end
  end
   root to: 'tops#index'
end
