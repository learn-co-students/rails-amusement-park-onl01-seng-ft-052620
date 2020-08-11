Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]
  resources :attractions, only: [:index, :show, :new, :create, :edit, :update]
  resources :rides, only: [:create]
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  root to: 'users#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
