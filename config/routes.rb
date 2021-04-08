Rails.application.routes.draw do
  root 'static#home'
  resources :static, only: [:home]
  resources :sessions, only: [:create]
  delete :logout, to: 'sessions#logout'
  get :logged_in, to: 'sessions#logged_in'
  
  namespace :api do
    namespace :v1 do
      resources :cars do
        resources :pictures
      end
      resources :users, only: [:index, :create, :show] do
        resources :appointments
      end
    end
  end
end
