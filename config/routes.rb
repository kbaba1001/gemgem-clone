Rails.application.routes.draw do
  root to: 'home#index'

  resources :things, only: %w(new create show edit update)
end
