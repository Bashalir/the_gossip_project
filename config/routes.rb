Rails.application.routes.draw do
  resources :comments
  resources :cities
  resources :users
  root to: 'home#index'
  resources :gossips
  get '/', to: 'home#index'
  get '/team', to: 'team#index'
  get '/contact', to: 'contact#index'
  get '/welcome/:name', to: 'welcome#index', as: 'welcome'
end
