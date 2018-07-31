Rails.application.routes.draw do
  root "pages#home"
  get "pages/home", to: 'pages#home'

  #resources
  get '/recipes', to: 'recipes#index'
  get '/recipes/new', to: 'recipes#new', as: 'new_recipe'
  get '/recipes/:id/edit', to: 'recipes#edit', as: 'edit_recipe'
  patch '/recipes/:id', to: 'recipes#update'
  put '/recipes/:id', to: 'recipes#update'
  get '/recipes/:id', to: 'recipes#show', as: 'recipe'
  delete '/recipes/:id', to: 'recipes#destroy'
  post '/recipes', to: 'recipes#create'

  get '/signup', to: 'chefs#new'
  resources :chefs, except: [:new]
end
