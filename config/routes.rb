Rails.application.routes.draw do
  get 'sessions/new'

  get 'pages/help'
  get 'pages/index' # => http://localhost:3000/pages/index
  root 'pages#index' # => http://localhost:3000/
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resources :topics

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  get 'favorites/index'
  post '/favorites', to: 'favorites#create'

  get 'comments/index'
  post '/comments', to: 'comments#create'
end
