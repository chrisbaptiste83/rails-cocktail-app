require 'rails_helper'

RSpec.describe CocktailRecipeIndexQuery do
    describe '#call' do
        context 'with no filters' do
            it 'returns all cocktail recipes ordered by title' do
                relation = double('Relation')
                expect(CocktailRecipe).to receive(:includes).with(:category, :ingredients).and_return(relation)
                expect(relation).to receive(:order).with(:title)

                described_class.new({}).call
            end
        end

        context 'with search param' do
            it 'searches and orders by created_at desc' do
                relation = double('Relation')
                search_relation = double('SearchRelation')
                expect(CocktailRecipe).to receive(:includes).with(:category, :ingredients).and_return(relation)
                expect(relation).to receive(:search).with('margarita').and_return(search_relation)
                expect(search_relation).to receive(:order).with(created_at: :desc)

                described_class.new(search: 'margarita').call
            end
        end

        context 'with user param' do
            it 'filters by user and orders by title' do
                relation = double('Relation')
                user_relation = double('UserRelation')
                expect(CocktailRecipe).to receive(:includes).with(:category, :ingredients).and_return(relation)
                expect(relation).to receive(:by_user).with('1').and_return(user_relation)
                expect(user_relation).to receive(:order).with(:title)

                described_class.new(user: '1').call
            end
        end

        context 'with user_id param' do
            it 'finds user and orders their recipes by title asc' do
                recipes = double('Recipes')
                eager_recipes = double('EagerRecipes')
                user = instance_double(User, cocktail_recipes: recipes)
                allow(CocktailRecipe).to receive(:includes).with(:category, :ingredients).and_return(double('Relation'))
                expect(User).to receive(:find).with('1').and_return(user)
                expect(recipes).to receive(:includes).with(:category, :ingredients).and_return(eager_recipes)
                expect(eager_recipes).to receive(:order).with(title: :asc)

                described_class.new(user_id: '1').call
            end
        end
    end
end
