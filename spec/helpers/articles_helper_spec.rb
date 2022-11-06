require 'rails_helper'

RSpec.describe ArticlesHelper, type: :helper do
  let(:created_at) { '2020-12-12T10:49:18.000Z' }

  describe 'posted_date' do
    it 'correctly returns the date when provided' do
      expect(helper.posted_date(created_at)).to eq('at December 12th, 2020 10:49')
    end

    it 'correctly handles when no date provided' do
      expect(helper.posted_date(nil)).to eq('')
    end
  end
end
