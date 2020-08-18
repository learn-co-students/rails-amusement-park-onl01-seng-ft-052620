Rails.application.routes.draw do

  resources :rides
  resources :users
  resources :attractions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#welcome'
  get '/signin', to: 'users#signin', as: 'signin'
  post '/signin', to: 'users#loggedin'
  delete '/', to: 'users#logout', as: 'logout'
  post '/attractions/:id', to: 'attractions#ride'
end
