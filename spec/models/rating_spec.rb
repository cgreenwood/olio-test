require 'rails_helper'

RSpec.describe Rating, type: :model do
  let(:object_id_one) { '1234' }
  let(:object_id_two) { '5678' }
  let(:object_id_three) { '4321' }

  before do
    described_class.create([
                             { rated_object_id: object_id_one, value: 1 },
                             { rated_object_id: object_id_one, value: 1 },
                             { rated_object_id: object_id_one, value: 1 },
                             { rated_object_id: object_id_two, value: 1 },
                             { rated_object_id: object_id_two, value: 1 }
                           ])
  end

  describe 'ratings_for method' do
    it 'correctly returns a list of ratings for the provided ID (one)' do
      expect(described_class.ratings_for(object_id_one)).to eq(3)
    end

    it 'correctly returns a list of ratings for the provided ID (two)' do
      expect(described_class.ratings_for(object_id_two)).to eq(2)
    end

    it 'correctly returns 0 for an object not yet rated (three)' do
      expect(described_class.ratings_for(object_id_three)).to eq(0)
    end
  end

  describe 'sum_by_object scope' do
    it 'returns the correct number of likes for the provided ID (one)' do
      expect(described_class.sum_by_object.where(rated_object_id: object_id_one).first.total_likes).to eq(3)
    end

    it 'returns the correct number of likes for the provided ID (two)' do
      expect(described_class.sum_by_object.where(rated_object_id: object_id_two).first.total_likes).to eq(2)
    end

    it 'does not include a record for an object not yet rated (three)' do
      expect(described_class.sum_by_object.where(rated_object_id: object_id_three).first).to be_nil
    end
  end
end
