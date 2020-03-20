require "rails_helper"

RSpec.describe 'Api::V1::VisitedPlaceReportssController', type: :request do
  before { signin_as_user }

  describe 'POST /api/v1/visited_place_reports' do
    context '入力内容が正しい場合' do
      it '場所と評価を保存できる' do
        place = create(:visited_place, name: 'test place')

        post '/api/v1/visited_place_reports', params: { visited_place_report: { visited_place_id: place.id, visited_on: Date.today, evaluation: :good }}

        aggregate_failures do
          expect(response).to have_http_status(:created)

          json = JSON.parse(response.body)
          expect(json['evaluation']).to eq('また行きたい')
        end
      end
    end

    context '入力内容が正しくない場合' do
      it '場所と評価を保存できない' do
        place = create(:visited_place, name: 'test place')

        post '/api/v1/visited_place_reports', params: { visited_place_report: { visited_place_id: place.id, visited_on: Date.tomorrow, evaluation: :good }}

        aggregate_failures do
          expect(response).to have_http_status(:unprocessable_entity)

          json = JSON.parse(response.body)
          expect(json['errors']).not_to be_blank
        end
      end
    end
  end
end
