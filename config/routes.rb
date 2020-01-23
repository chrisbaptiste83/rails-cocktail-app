Rails.application.routes.draw do 
  

  devise_for :users
        

  resources :alcohol_types, only: [:show, :index] 

  resources :cocktail_recipe_alcohol_types, only: [:show, :index]
  
  resources :users, only: [:show] 

  resources :cocktail_recipes
 

  resources :categories, only: [:show, :index]
  
  root to: 'home#index'
  
end
