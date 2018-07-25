Rails.application.routes.draw do
  root to: 'tops#index'

  resources :feeds do
    collection do
      post :confirm
    end
  end

  resources :contacts
  resources :sessions, only: [:new, :create, :destroy]
  resources :favorites, only: [:create, :destroy]
  resources :users
  resources :blogs do
    collection do
      post :confirm
    end
  end

  mount LetterOpenerWeb::Engine, at: "/letter_opener"
end
