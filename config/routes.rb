Rails.application.routes.draw do 
  

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :ingredients, only: [:show, :index]
  resources :cocktail_recipes
  resources :categories, only: [:show, :index]
  
  root to: 'home#index' 
  get '/home/index', to: 'home#index' 
  post '/ai_bartender', to: 'ai_bartender#create'
  post '/ai_bartender/stream', to: 'ai_bartender#stream', as: :ai_bartender_stream
  post '/ai_bartender/reset', to: 'ai_bartender#reset', as: :reset_ai_bartender

  resources :users, only: [:show] do 
    resources :cocktail_recipes, only: [:show, :index, :new]
  end 

  resources :cocktail_recipes do
    resources :comments
  end
  
end
