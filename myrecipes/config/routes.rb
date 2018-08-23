Rails.application.routes.draw do
  root "pages#home"
  get "pages/home", to: 'pages#home'

  #resources of recipe
  # get '/recipes', to: 'recipes#index'
  # get '/recipes/new', to: 'recipes#new', as: 'new_recipe'
  # get '/recipes/:id/edit', to: 'recipes#edit', as: 'edit_recipe'
  # patch '/recipes/:id', to: 'recipes#update'
  # put '/recipes/:id', to: 'recipes#update'
  # get '/recipes/:id', to: 'recipes#show', as: 'recipe'
  # delete '/recipes/:id', to: 'recipes#destroy'
  # post '/recipes', to: 'recipes#create'
  #resources of recipe

  resources :recipes do
    resources :comments, only: [:create]
  end

  get '/signup', to: 'chefs#new'
  resources :chefs, except: [:new]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :ingredients, except: [:destroy]

  mount ActionCable.server => '/cable'

  get '/chat', to: 'chatrooms#show'

  resources :messages, only: [:create]
end
