require "rails_helper"

RSpec.describe 'VisitedPlaces', type: :request do
  describe 'GET /visited_places/:id' do
    it '場所情報と評価一覧が表示される' do
      place = create(:visited_place, name: 'for places test')
      dates = [Date.today, Date.today - 3.days, Date.today - 7.days]
      dates.each do |date|
        create(:visited_place_report, visited_place: place, visited_on: date)
      end

      get "/visited_places/#{place.id}"

      aggregate_failures do
        expect(response).to have_http_status(:success)
        expect(response.body).to include('for places test')
        dates.each do |date|
          expect(response.body).to include(date.strftime('%Y/%m/%d'))
        end
      end
    end
  end

  describe 'PUT /visited_places/:id' do
    it '場所情報が更新できる' do
      place = create(:visited_place, name: 'for update', address: 'foo')
      put "/visited_places/#{place.id}", params: { visited_place: { name: 'updated_name', address: 'bar' } }
      aggregate_failures do
        expect(response).to have_http_status(:found)
        follow_redirect!

        expect(response.body).not_to include('for update')
        expect(response.body).not_to include('foo')
        expect(response.body).to include('updated_name')
        expect(response.body).to include('bar')
      end
    end
  end
end
