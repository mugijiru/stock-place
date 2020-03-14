require 'rails_helper'

RSpec.describe 'Stocks', type: :request do
  describe 'GET /stocks' do
    it 'ストックした場所一覧を取得できる' do
      params = visited_place_params.merge(name: 'おいしいラーメン屋')
      create(:visited_place, params)
      get stocks_path
      expect(response.body).to include('おいしいラーメン屋')
    end
  end

  describe 'POST /stocks' do
    it '場所と評価を同時にストックできる' do
      params = {
        stock: {
          visited_place: visited_place_params.merge(address: 'test 1-1-1'),
          visited_place_report: visited_place_report_params.merge(visited_on: Date.yesterday, evaluation: "not_bad")
        }
      }
      post stocks_path, params: params

      aggregate_failures do
        expect(response).to have_http_status(:found)

        follow_redirect!

        expect(response).to have_http_status(:success)
        expect(response.body).not_to include('New stock')
        expect(response.body).to include('test 1-1-1')
        expect(response.body).to include(Date.yesterday.strftime('%Y/%m/%d'))
        expect(response.body).to include('たまになら')
      end
    end
  end

  def visited_place_params
    { name: 'test', address: 'test x-y-z' }
  end

  def visited_place_report_params
    { visited_on: Date.yesterday, evaluation: :good }
  end
end
