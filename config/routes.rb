Rails.application.routes.draw do
  root 'home#index'

  resources :stocks, only: :index
end
