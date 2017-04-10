Rails.application.routes.draw do

  get 'sessions/create'

  get 'sessions/destroy'

  get 'home/show'

  # auth-related routes
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'


  # application resources
  resources :users
  resources :subscriptions
  resources :categories

  # auth related resources
  resources :sessions, only: [:create, :destroy]
  resource :home, only: [:show]

  root to: "home#show"

end
