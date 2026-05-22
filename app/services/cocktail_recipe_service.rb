class CocktailRecipeService
    def self.create_with_ingredients(user, recipe_params, ingredient_params)
        recipe = user.cocktail_recipes.new(recipe_params)
        if recipe.save
            recipe.add_ingredients_to_recipe(ingredient_params)
        end
        recipe
    end

    def self.update_with_ingredients(recipe, recipe_params, ingredient_params)
        return false unless recipe.update(recipe_params)
        recipe.add_ingredients_to_recipe(ingredient_params)
        true
    end
end
