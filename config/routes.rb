Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'static#home'
  resources :static, only: [:home]
  resources :sessions, only: [:index, :create, :destroy]
  resources :users, only: [:index, :create]
end
