Rails.application.routes.draw do
  #root 'static#home'
  #resources :static, only: [:home]
  root 'api/v1/cars#index'
  resources :sessions, only: [:create, :index]
  delete :logout, to: 'sessions#logout'
  get :logged_in, to: 'sessions#logged_in'

  namespace :admin do
    resources :cars do
      resources :pictures
    end

    resources :users do
      resources :appointments
    end

    root 'cars#index'
  end
  
  namespace :api do
    namespace :v1 do
      resources :cars, only: [:index, :show]
      resources :users, only: [:create, :update] do
        resources :appointments, only: [:index, :create, :update, :destroy]
      end
    end
  end
end
