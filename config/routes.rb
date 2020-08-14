Rails.application.routes.draw do
  resources :attractions
  get '/signin' => 'sessions#signin'
  get '/signout'=>'sessions#signout'
  post '/signin' => 'sessions#login'
  

  root 'sessions#signin'
  resources :users
  post '/users/:id' => 'users#show_post_ride'

end
