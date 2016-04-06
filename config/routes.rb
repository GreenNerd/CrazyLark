Rails.application.routes.draw do
get 'signup' => 'users#new'
resources :users
resources :sessions
resources :employees
resources :send_messages
resources :mobile_validates

end
