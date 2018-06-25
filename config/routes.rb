Rails.application.routes.draw do
  get 'sessions/new'

  get 'tops/index'
  resources :sessions, only: [:new, :create, :destroy]
    resources :users
  resources :blogs do
    collection do
      post :confirm
    end
  end
   root to: 'tops#index'
end
