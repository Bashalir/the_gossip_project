Rails.application.routes.draw do
  resources :sessions, only: %i[destroy new create]
  
  resources :gossips do
    resources :comments
    resources :likes, only: %i[destroy create]
  end
  resources :cities
  resources :users
  root to: 'home#index'

  get '/', to: 'home#index'
  get '/team', to: 'team#index'
  get '/contact', to: 'contact#index'
  get '/welcome/:name', to: 'welcome#index', as: 'welcome'
end
