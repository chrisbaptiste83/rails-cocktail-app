Rails.application.routes.draw do
  devise_for :users
  resources :alcohol_types
  resources :comments
  resources :ingredients
  resources :cocktail_recipes
  resources :categories
  resources :users
  root to: 'categories#index'
end
