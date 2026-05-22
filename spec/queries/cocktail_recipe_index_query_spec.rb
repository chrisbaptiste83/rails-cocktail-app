require 'rails_helper'

RSpec.describe CocktailRecipeIndexQuery do
    describe '#call' do
        context 'with no filters' do
            it 'returns all cocktail recipes ordered by title' do
                expect(CocktailRecipe).to receive(:all).and_return(CocktailRecipe.all)
                allow(CocktailRecipe).to receive(:order).with(:title).and_return(CocktailRecipe.all)

                described_class.new({}).call
            end
        end

        context 'with search param' do
            it 'searches and orders by created_at desc' do
                relation = double('Relation')
                expect(CocktailRecipe).to receive(:search).with('margarita').and_return(relation)
                expect(relation).to receive(:order).with(created_at: :desc)

                described_class.new(search: 'margarita').call
            end
        end

        context 'with user param' do
            it 'filters by user and orders by title' do
                relation = double('Relation')
                expect(CocktailRecipe).to receive(:by_user).with('1').and_return(relation)
                expect(relation).to receive(:order).with(:title)

                described_class.new(user: '1').call
            end
        end

        context 'with user_id param' do
            it 'finds user and orders their recipes by title asc' do
                user = instance_double(User, cocktail_recipes: CocktailRecipe.all)
                expect(User).to receive(:find).with('1').and_return(user)
                expect(user.cocktail_recipes).to receive(:order).with(title: :asc)

                described_class.new(user_id: '1').call
            end
        end
    end
end
