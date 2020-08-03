Rails.application.routes.draw do
  root to: 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'home#index'
  get '/team', to: 'team#index'
  get '/contact', to: 'contact#index'
  get '/welcome/:name', to: 'welcome#index'
end
