Rails.application.routes.draw do
  devise_for :users 

  resources :alcohol_types, only: [:show, :index] 

  resources :cocktail_recipe_alcohol_types, only: [:show, :index]

  resources :cocktail_recipes do
    resources :comments 
  end 

  resources :users, only: [:show] do
    resources :cocktail_recipes
  end 

  resources :categories, only: [:show, :index]
  resources :users, only: [:show, :index]
  root to: 'users#home'
end
