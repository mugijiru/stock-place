require "rails_helper"

RSpec.describe 'Api::V1::PlacesController', type: :request do
  describe 'GET /api/v1/places' do
    it '登録済の場所一覧を取得できる' do
      create_list(:place, 5)

      get '/api/v1/places'

      aggregate_failures do
        expect(response).to have_http_status(:success)

        json = JSON.parse(response.body)
        expect(json.size).to eq(5)
      end
    end
  end
end
