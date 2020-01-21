module CocktailRecipesHelper 

    def last_updated(cocktail_recipe)
        cocktail_recipe.updated_at.strftime("Last updated %A, %b %e, at %l:%M %p")
      end 

end
