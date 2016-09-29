Rails.application.routes.draw do
  get 'users/profile' => 'users#profile'

  #get 'users/index'

  #get 'users/create'

  #get 'users/:id' => 'users#show'

  get '/memberships/destroy/:user_id' => 'memberships#destroy'

  get 'memberships/connecting/:id'  => 'memberships#connecting'

  get 'memberships/accept/:id/:user_id' => 'memberships#accept'

  get '/memberships/ignore/:id' => 'memberships#ignore'

  get '/' => 'users#index'

  post '/users/create' => 'users#create'

  post '/users/new' => 'users#new'

  post 'users/login'

  post 'show/new' => 'show#new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
