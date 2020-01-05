Rails.application.routes.draw do
  root 'home#index'

  resources :stocks, only: %i(index new create destroy)
end
