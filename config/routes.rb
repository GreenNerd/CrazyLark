Rails.application.routes.draw do
	get 'signup' => 'users#new'
	resources :users
	get 'login' => 'session#new'
	post 'login' => 'session#create'
	delete 'logout' => 'session#destroy'
	resources :employees
end
