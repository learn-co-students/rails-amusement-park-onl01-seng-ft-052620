Rails.application.routes.draw do
  get '/signin', to: 'session#new', as: 'signin'
  get '/signout', to: 'session#destroy', as: 'signout'
  post '/signin', to: 'session#create'

  resources :attractions
  resources :rides
 
  resources :users
  root 'static#home'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
