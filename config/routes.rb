Rails.application.routes.draw do
  get 'pages/profile'

  devise_for :users, path: '', path_names: {sign_in: 'login', sign_out: 'logout', sign_up: 'register'}

  resources :contacts

  get 'pages/index'

  root to: "contacts#index"

end
