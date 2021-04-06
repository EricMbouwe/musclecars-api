Rails.application.routes.draw do
  resources :appointments
  resources :cars
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :sessions, only: [:index, :create]
  resources :users, only: [:index, :create]
  resources :static, only: [:home]
  delete :logout, to: 'sessions#logout'
  get :logged_in, to: 'sessions#logged_in'
  root 'static#home'
end
