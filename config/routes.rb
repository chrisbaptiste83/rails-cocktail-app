Rails.application.routes.draw do 
  

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
        
  
  resources :users, only: [:show] do 
    resources :cocktail_recipes, only: [:show, :index, :new]
  end 
 
  resources :ingredients, only: [:show, :index]

  resources :cocktail_recipes

  resources :categories, only: [:show, :index]
  
  root to: 'home#index' 

  get '/home/index', to: 'home#index'
  
end
