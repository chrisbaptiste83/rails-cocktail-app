Rails.application.routes.draw do
  resources :alcohol_types
  resources :comments
  resources :ingredients
  resources :cocktail_recipes
  resources :categories
  resources :users
  get '/login', to: 'sessions#new' 
  post '/login', to: 'sessions#create' 
  post '/logout', to: 'sessions#logout'
  root to: 'users#new'
end
