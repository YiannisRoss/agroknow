Rails.application.routes.draw do
  post 'sign_in', to: 'sessions#create'

  resources :users, only: :create
  patch 'users/update_info', to: 'users#update'
  post 'attach_resume', to: 'users#attach_resume'

  resources :sessions, only: %i[index show destroy]
  resource  :password, only: %i[edit update]
  namespace :identity do
    resource :email,              only: %i[edit update]
    resource :email_verification, only: %i[show create]
    resource :password_reset,     only: %i[new edit create update]
  end
  get 'weather_data', to: 'weather_data#index'
end
