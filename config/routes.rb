Rails.application.routes.draw do
  root to: 'home#index'

  get '/', to: 'home#index'
  get '/team', to: 'team#index'
  get '/contact', to: 'contact#index'
  get '/welcome/:name', to: 'welcome#index', as: 'welcome'
  get '/gossips/:id', to: 'gossips#index', as: 'gossips'
  get 'users/:id', to: 'users#index', as: 'users'
end
