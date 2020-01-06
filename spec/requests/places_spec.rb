require "rails_helper"

RSpec.describe 'Places', type: :request do
  describe 'GET /places/:id' do
    it '場所情報と評価一覧が表示される' do
      place = create(:place, name: 'for places test')
      dates = [Date.today, Date.today - 3.days, Date.today - 7.days]
      dates.each do |date|
        create(:place_evaluation, place: place, visited_on: date)
      end

      get "/places/#{place.id}"

      aggregate_failures do
        expect(response).to have_http_status(:success)
        expect(response.body).to include('for places test')
        dates.each do |date|
          expect(response.body).to include(date.strftime('%Y/%m/%d'))
        end
      end
    end
  end

  describe 'PUT /places/:id' do
    it '場所情報が更新できる' do
      place = create(:place, name: 'for update', address: 'foo')
      put "/places/#{place.id}", params: { place: { name: 'updated_name', address: 'bar' } }
      expect(response).to have_http_status(:ok)
      expect(response.body).not_to include('for update')
      expect(response.body).not_to include('foo')
      expect(response.body).to include('updated_name')
      expect(response.body).to include('bar')
    end
  end
end
