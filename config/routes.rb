Rails.application.routes.draw do
  root 'pages#index'
  get 'about', to: 'pages#about'
  get 'index', to: 'pages#index'

end
