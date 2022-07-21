Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do  
   get '/users/sign_out' => 'devise/sessions#destroy'     
  end
  resources :logs
  resources :tasks
  resources :projects
  resources :members
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'home/about'
  get 'home/index'
  root 'home#index'
  get ':ViewCode', to: 'projects#show', as: :ViewCode
  # Defines the root path route ("/")
  # root "articles#index"
end
