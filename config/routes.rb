Rails.application.routes.draw do 
  

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
        

  resources :alcohol_types, only: [:show, :index] 
  
  resources :users, only: [:show] do 
    resources :cocktail_recipes 
  end 
 
  resources :cocktail_recipes

  resources :categories, only: [:show, :index]
  
  root to: 'home#index' 

  get '/home/index', to: 'home#index'
  
end
