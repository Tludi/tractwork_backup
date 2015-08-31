Rails.application.routes.draw do

  root to: 'users#index'

  # get 'user_sessions/new'
  # get 'user_sessions/create'
  # get 'user_sessions/destroy'
  resources :user_sessions

  # get 'password_resets/create'
  # get 'password_resets/edit'
  # get 'password_resets/update'

  resources :password_resets
  resources :users
  resources :accounts

  get 'login' => 'user_sessions#new', as: :login
  post 'logout' => 'user_sessions#destroy', as: :logout

end
