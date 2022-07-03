Rails.application.routes.draw do
  devise_for :users
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
