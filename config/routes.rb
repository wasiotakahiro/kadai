Rails.application.routes.draw do
  resources :blogs do
    collection do
      post :confirm
      root to: 'blogs#index'
    end
  end
end
