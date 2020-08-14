Rails.application.routes.draw do
  resources :attractions 

  get '/signin' => 'sessions#signin'
  post '/signin' => 'sessions#create'
  get '/signout' => 'sessions#signout'

  resources :users
  

  root 'sessions#signin'
end

