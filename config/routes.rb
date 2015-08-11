Rails.application.routes.draw do
  root to: 'home#index'

  resources :things, only: %w(new create show edit update) do
    member do
      post :create_comment
    end
  end
end
