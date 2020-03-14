require "rails_helper"

RSpec.describe 'Api::V1::VisitedPlacesController', type: :request do
  describe 'GET /api/v1/places' do
    it '登録済の場所一覧を取得できる' do
      create_list(:visited_place, 5)

      get '/api/v1/visited_places'

      aggregate_failures do
        expect(response).to have_http_status(:success)

        json = JSON.parse(response.body)
        expect(json.size).to eq(5)
      end
    end

    it '検索クエリがある場合その内容で絞り込める' do
      create(:visited_place, name: '水星')
      create(:visited_place, name: '火星')
      create(:visited_place, name: '土星')
      create(:visited_place, name: '冥王星')
      create(:visited_place, name: '天王星')

      get '/api/v1/visited_places', params: { q: '王' }

      aggregate_failures do
        expect(response).to have_http_status(:success)

        json = JSON.parse(response.body)
        expect(json.size).to eq(2)
      end
    end
  end

  describe 'POST /api/v1/visited_places' do
    context 'パラメータが正しければ' do
      it '場所を新規登録できる' do
        post '/api/v1/visited_places', params: { visited_place: { name: 'M78星雲', address: '宇宙の彼方' } }

        aggregate_failures do
          expect(response).to have_http_status(:created)

          json = JSON.parse(response.body)
          expect(json['name']).to eq('M78星雲')
        end
      end
    end

    context 'パラメータが誤っていれば' do
      it '場所の登録に失敗' do
        post '/api/v1/visited_places', params: { visited_place: { name: '', address: '宇宙の彼方' } }

        aggregate_failures do
          expect(response).to have_http_status(:unprocessable_entity)

          json = JSON.parse(response.body)
          expect(json['errors']).to include('名称を入力してください')
        end
      end
    end
  end
end
