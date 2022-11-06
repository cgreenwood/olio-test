require 'rails_helper'

RSpec.describe "Articles", type: :request do
  describe "GET /index" do
    it 'returns the index template' do
      get '/'
      expect(response).to render_template(:index)
    end
  end

  describe 'POST /like' do
    it 'successfully creates the rating' do
      expect(Rating.count).to eq(0)
      post "/like", params: { rated_object_id: '1234', value: '1' }
      expect(Rating.count).to eq(1)
    end

    it 'redirects back to the index page' do
      post "/like", params: { rated_object_id: '1234', value: '1' }
      follow_redirect!
      expect(response).to render_template(:index)
      expect(response.body).to include('Successfully liked this article')
    end
  end
end
