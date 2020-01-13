Rails.application.routes.draw do
  resources :comments
  resources :ingredients
  resources :cocktail_recipes
  resources :categories
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
