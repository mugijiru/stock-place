Rails.application.routes.draw do
  root 'home#index'

  resources :stocks, only: %i(index new show create destroy)
end
