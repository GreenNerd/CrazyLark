Rails.application.routes.draw do
  get 'signup' => 'users#new'
  resources :users
  resources :sessions, only: [:create]
  resources :employees
  resources :send_messages, only: [:create]
  resources :mobile_validates, only: [:create]
  resources :messages, only: [:create]
  resources :key_validates, only: [:create]
  resources :password_resets, only: [:update]
  resources :time_sets, only: [:update]
  resources :corperations, only: [:create, :show]
  resources :departments, only: [:create, :show, :destroy]
  resources :employees, only: [:create, :show, :index, :update]
  resources :get_macs, only: [:create]
end
