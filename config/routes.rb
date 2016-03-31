Rails.application.routes.draw do
	get 'signup' => 'users#new'
	resources :users
	resources :sessions
	resources :employees
	resources :sendmessages
end
