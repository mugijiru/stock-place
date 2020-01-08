require "rails_helper"

RSpec.describe 'Places::Evaluations', type: :request do
  describe 'POST /places/:id/evaluations' do
    context '正しいリクエストの場合' do
      it '新規評価が登録できる' do
        place = create(:place, name: 'test_place')
        post "/places/#{place.id}/evaluations", params: { evaluation: { visited_on: Date.today, point: :good } }
        aggregate_failures do
          expect(response).to have_http_status(:found)
          follow_redirect!
          expect(response.body).to include('test_place')
          expect(response.body).to include(Date.today.strftime('%Y/&m/%d'))
          expect(response.body).to include('また来たい')
        end
      end
    end

    context '誤ったリクエストの場合' do
      it '新規評価が登録に失敗する' do
        place = create(:place, name: 'test_place')
        post "/places/#{place.id}/evaluations", params: { evaluation: { visited_on: Date.today, point: -1000 } }
        aggregate_failures do
          expect(response).to have_http_status(:ok)
          expect(response.body).to include('test_place')
          expect(response.body).to include(Date.today.strftime('%Y/&m/%d'))
          expect(response.body).to include('評価の値は不正です')
        end
      end
    end
  end
end
