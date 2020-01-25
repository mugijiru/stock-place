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

  describe 'POST /api/v1/places' do
    context 'パラメータが正しければ' do
      it '場所を新規登録できる' do
        post '/api/v1/places', params: { place: { name: 'M78星雲', address: '宇宙の彼方' } }

        aggregate_failures do
          expect(response).to have_http_status(:created)

          json = JSON.parse(response.body)
          expect(json['name']).to eq('M78星雲')
        end
      end
    end

    context 'パラメータが誤っていれば' do
      it '場所の登録に失敗' do
        post '/api/v1/places', params: { place: { name: '', address: '宇宙の彼方' } }

        aggregate_failures do
          expect(response).to have_http_status(:unprocessable_entity)

          json = JSON.parse(response.body)
          expect(json['errors']).to include('名称を入力してください')
        end
      end
    end
  end
end
