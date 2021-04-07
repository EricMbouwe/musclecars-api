Rails.application.routes.draw do
  resources :appointments
  resources :cars
  resources :sessions, only: [:index, :create]
  resources :users, only: [:index, :create]
  resources :static, only: [:home]
  delete :logout, to: 'sessions#logout'
  get :logged_in, to: 'sessions#logged_in'
  root 'static#home'
end
