Rails.application.routes.draw do
  # root 'static#home'
  root 'cars#index'
  resources :static, only: [:home]
  resources :sessions, only: [:create]
  delete :logout, to: 'sessions#logout'
  get :logged_in, to: 'sessions#logged_in'

  namespace :admin do
    ressources :cars do
      ressources :pictures
    end

    resources :users do
      resources :appointments
    end

    root to: 'cars#index'
  end
  
  namespace :api do
    namespace :v1 do
      resources :cars, only: [:index, :show] do
        resources :pictures, Only: [:index]
      end
      resources :users, only: [:create] do
        resources :appointments, only: [:index, :create, :update, :destroy]
      end
    end
  end
end
