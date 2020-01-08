Rails.application.routes.draw do
  root 'home#index'

  resources :stocks, only: %i[index new create destroy]
  resources :places, only: %i[show edit update] do
    resources :evaluations, only: %i[new create], controller: 'places/evaluations'
  end
end
