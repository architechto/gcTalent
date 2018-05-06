Rails.application.routes.draw do
	get 'users/show'

	get 'pages/profile'
	get 'pages/index'

	devise_for :users, path: '', path_names: {sign_in: 'login', sign_out: 'logout', sign_up: 'register'}

	resources :contacts
	resources :users

	root to: "contacts#index"

end

