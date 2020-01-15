require "rails_helper"

RSpec.describe 'Api::V1::PlaceEvaluationsController', type: :request do
  describe 'POST /api/v1/place_evaluations' do
    it '登録済の場所一覧を取得できる' do
      place = create(:place, name: 'test place')

      post '/api/v1/place_evaluations', params: { place_evaluation: { place_id: place.id, visited_on: Date.today, point: :good }}

      aggregate_failures do
        expect(response).to have_http_status(:created)

        json = JSON.parse(response.body)
        expect(json['point']).to eq('good')
      end
    end
  end
end
