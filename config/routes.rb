Rails.application.routes.draw do

  root to: 'products#index'

  resources :products, only: [:index, :show]
  resources :categories, only: [:show]
  resource :about, only: [:show], controller: "about"
  resource :cart, only: [:show] do
    post   :add_item
    post   :remove_item
  end

  resources :orders, only: [:create, :show]

  namespace :admin do
    root to: 'dashboard#show'
    resources :products, except: [:edit, :update, :show]
    resources :categories, only: [:index, :new, :create]
  end

  # Routes to sign up new users
  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  # Routes to Login Form, Logging In and Logging Out for users
  get '/login' => 'sessions#new'
  post'/login' => 'sessions#create'
  get '/logout'=> 'sessions#destroy'

 end
