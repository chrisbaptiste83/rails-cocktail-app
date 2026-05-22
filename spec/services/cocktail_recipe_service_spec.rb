require 'rails_helper'

RSpec.describe CocktailRecipeService do
    describe '.create_with_ingredients' do
        it 'builds a recipe from the user and adds ingredients after save' do
            recipes_relation = double('RecipesRelation')
            recipe = instance_double(CocktailRecipe, save: true, add_ingredients_to_recipe: nil)
            user = instance_double(User, cocktail_recipes: recipes_relation)

            expect(recipes_relation).to receive(:new).with({ title: 'Test' }).and_return(recipe)
            expect(recipe).to receive(:add_ingredients_to_recipe).with({})

            result = described_class.create_with_ingredients(user, { title: 'Test' }, {})
            expect(result).to eq(recipe)
        end
    end

    describe '.update_with_ingredients' do
        it 'returns true on success' do
            recipe = instance_double(CocktailRecipe, update: true)
            allow(recipe).to receive(:add_ingredients_to_recipe)

            result = described_class.update_with_ingredients(recipe, {}, {})
            expect(result).to be true
        end

        it 'returns false on failure' do
            recipe = instance_double(CocktailRecipe, update: false)

            result = described_class.update_with_ingredients(recipe, {}, {})
            expect(result).to be false
        end
    end
end
