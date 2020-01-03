require 'rails_helper'

RSpec.describe 'Stocks', type: :request do
  describe 'GET /stocks' do
    it 'ストックした場所一覧を取得できる' do
      params = place_params.merge(name: 'おいしいラーメン屋')
      create(:place, params)
      get stocks_path
      expect(response.body).to include('おいしいラーメン屋')
    end
  end

  describe 'POST /stocks' do
    it '場所と評価を同時にストックできる' do
      params = {
        stock: {
          place: place_params.merge(address: 'test 1-1-1'),
          place_evaluation: place_evaluation_params.merge(visited_on: Date.yesterday, point: "not_bad")
        }
      }
      post stocks_path, params: params

      aggregate_failures do
        expect(response).to have_http_status(:found)

        follow_redirect!

        expect(response).to have_http_status(:success)
        expect(response.body).not_to include('New stock')
        expect(response.body).to include('test 1-1-1')
        expect(response.body).to include(Date.yesterday.to_s(:db)) # TODO: I18n
        expect(response.body).to include('たまになら')
      end
    end
  end

  describe 'PUT /stocks/:id' do
    it 'ストックした場所を更新できる' do
      create_params = place_params.merge(name: 'おいしいラーメン屋')
      place = create(:place, create_params)

      params = { place: place_params.merge(name: 'おいしい中華料理屋') }
      put stock_path(place), params: params

      aggregate_failures do
        expect(response).to have_http_status(:found)

        follow_redirect!

        expect(response).to have_http_status(:success)
        expect(response.body).not_to include('ラーメン屋')
        expect(response.body).to include('中華料理屋')
      end
    end
  end

  describe 'DELETE /stocks/:id' do
    it 'ストックした場所を削除できる' do
      create_params = place_params.merge(name: 'おいしいラーメン屋')
      place = create(:place, create_params)

      delete stock_path(place)

      aggregate_failures do
        expect(response).to have_http_status(:found)

        follow_redirect!

        expect(response).to have_http_status(:success)
        expect(response.body).not_to include('ラーメン屋')
      end
    end
  end

  def place_params
    { name: 'test', address: 'test x-y-z' }
  end

  def place_evaluation_params
    { visited_on: Date.yesterday, point: :good }
  end
end
