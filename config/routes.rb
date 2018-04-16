Rails.application.routes.draw do
  devise_for :users
  resources :contacts

  get 'pages/index'

  root to: "contacts#index"

end
