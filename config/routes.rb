Rails.application.routes.draw do
  root 'pages#index'
  get 'about', to: 'pages#about'
  get 'index', to: 'pages#index'
  get 'signup', to: 'users#new'
  resources :articles
  post 'users', to: 'users#create'
  resources :users, except: [:new]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources :categories, except: [:destroy]
end
