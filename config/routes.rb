Rails.application.routes.draw do
  get 'signup' => 'users#new'
  resources :users
  resources :sessions, only: [:create]
  resources :employees
  resources :send_messages, only: [:create]
  resources :mobile_validates, only: [:create]
  resources :messages, only: [:create]
  resources :key_validates, only: [:create]
  resources :password_reset, only: [:create]
end
