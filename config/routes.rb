Rails.application.routes.draw do
  resources :attractions
  root "static_pages#home"
  resources :users
  get '/signin', to: "session#new"
  post '/signin', to: "session#create"
  delete '/session', to: 'session#destroy'
  post '/rides', to: 'rides#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
