Rails.application.routes.draw do
<<<<<<< HEAD
=======
  devise_for :users
>>>>>>> 02e5b70 (Credentials management without logout)
  resources :logs
  resources :tasks
  resources :projects
  resources :members
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'home/about'
  get 'home/index'
  root 'home#index'
  # Defines the root path route ("/")
  # root "articles#index"
end
