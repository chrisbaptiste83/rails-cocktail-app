class CocktailRecipeService
    def self.create_with_ingredients(user, recipe_params, ingredient_params)
        recipe = user.cocktail_recipes.new(recipe_params)
        ActiveRecord::Base.transaction do
            recipe.save!
            recipe.add_ingredients_to_recipe(ingredient_params)
        end
        recipe
    rescue ActiveRecord::RecordInvalid
        recipe
    end

    def self.update_with_ingredients(recipe, recipe_params, ingredient_params)
        ActiveRecord::Base.transaction do
            recipe.update!(recipe_params)
            recipe.add_ingredients_to_recipe(ingredient_params)
        end
        true
    rescue ActiveRecord::RecordInvalid
        false
    end
end
