require 'rails_helper'

RSpec.describe BartenderPicksQuery do
    describe '#call' do
        context 'with no vibe or spirit' do
            it 'returns a distinct limited scope' do
                result = described_class.new(nil, nil).call
                expect(result).to be_a(ActiveRecord::Relation)
            end
        end

        context 'with a spirit' do
            it 'filters by ingredient name' do
                result = described_class.new(nil, 'gin').call
                expect(result).to be_a(ActiveRecord::Relation)
            end
        end

        context 'with a vibe' do
            it 'filters by vibe keywords' do
                result = described_class.new('bright', nil).call
                expect(result).to be_a(ActiveRecord::Relation)
            end
        end
    end
end
