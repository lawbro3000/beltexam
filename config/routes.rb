Rails.application.routes.draw do
 
  get 'users/new'

  # get 'users/create'
  # get 'playlists/c'
  root 'sessions#new'
  resource :sessions
  resources :users
  resources :invites
  resources :friendslists
  resources :friendships
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
