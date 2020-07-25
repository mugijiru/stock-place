require "rails_helper"

RSpec.describe 'VisitedPlaces::Reports', type: :request do
  before { signin_as_user }

  describe 'POST /visited_places/:id/reports' do
    context '正しいリクエストの場合' do
      it '新規評価が登録できる' do
        place = create(:visited_place, name: 'test_place')
        post "/visited_places/#{place.id}/reports", params: { visited_place_report: { visited_on: Date.today, evaluation: :good } }
        aggregate_failures do
          expect(response).to have_http_status(:found)
          follow_redirect!
          expect(response.body).to include('test_place')
          expect(response.body).to include(Date.today.strftime('%Y/%m/%d'))
          expect(response.body).to include('また行きたい')
        end
      end
    end

    context '誤ったリクエストの場合' do
      it '新規評価が登録に失敗する' do
        place = create(:visited_place, name: 'test_place')
        post "/visited_places/#{place.id}/reports", params: { visited_place_report: { visited_on: Date.today, evaluation: -1000 } }
        aggregate_failures do
          expect(response).to have_http_status(:ok)
          expect(response.body).to include('test_place')
          expect(response.body).to include(Date.today.strftime('%Y-%m-%d'))
          expect(response.body).to include('評価は一覧にありません')
        end
      end
    end
  end

  describe 'PUT /visited_places/:visited_place_id/reports/:id' do
    context '正しいリクエストの場合' do
      it '評価を修正できる' do
        place = create(:visited_place, name: 'test_place')
        report = create(:visited_place_report, visited_place: place, visited_on: Date.yesterday, evaluation: :no_good)
        put "/visited_places/#{place.id}/reports/#{report.id}", params: { visited_place_report: { visited_on: Date.today, evaluation: :good } }
        aggregate_failures do
          expect(response).to have_http_status(:found)
          follow_redirect!
          expect(response.body).to include('test_place')
          expect(response.body).to include(Date.today.strftime('%Y/%m/%d'))
          expect(response.body).to include('また行きたい')
        end
      end
    end

    context '誤ったリクエストの場合' do
      it '評価を修正できない' do
        place = create(:visited_place, name: 'test_place')
        report = create(:visited_place_report, visited_place: place, visited_on: Date.yesterday, evaluation: :no_good)
        put "/visited_places/#{place.id}/reports/#{report.id}", params: { visited_place_report: { visited_on: Date.today, evaluation: 2000 } }
        aggregate_failures do
          expect(response).to have_http_status(:ok)
          expect(response.body).to include('test_place')
          expect(response.body).to include('評価は一覧にありません')
          expect(response.body).to include(Date.today.strftime('%Y-%m-%d'))
          expect(response.body).to include('また行きたい')
        end
      end
    end
  end
end
