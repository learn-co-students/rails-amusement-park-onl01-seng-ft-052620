Rails.application.routes.draw do

  root 'welcome#home'

  get '/users/new', to: 'users#new', as: 'signup'
  post '/users/new', to: 'users#create'
  
  resources 'users', only: [:show]

  get '/signin', to: 'sessions#new', as: 'signin'
  post '/signin', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources 'attractions', only: [:index,:show,:new,:create,:edit,:update] do
    post 'ride', to: 'attractions#ride', on: :member
  end

end
