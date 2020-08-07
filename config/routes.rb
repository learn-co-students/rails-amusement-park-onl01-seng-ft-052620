Rails.application.routes.draw do
  resources :attractions
  get '/signin' => 'sessions#signin'
  get '/signout'=>'sessions#signout'
  post '/signin' => 'sessions#login'
  
  # get 'users/new'
  # get 'users/create'
  # get 'users/edit'
  # get 'users/update'
  # get 'users/destroy'
  # get 'users/show'
  root 'sessions#signin'
  resources :users
  post '/users/:id' => 'users#show_post_ride'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
