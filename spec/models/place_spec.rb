require 'rails_helper'

RSpec.describe Place, type: :model do
  describe 'finder methods' do
    describe 'recently_visited' do
      it '最後に訪問した順の降順で返って来ること' do
        place1 = create(:place, name: 'place1')
        create(:place_evaluation, place: place1, visited_on: Date.today)
        place2 = create(:place, name: 'place2')
        create(:place_evaluation, place: place2, visited_on: Date.today - 2.days)
        place3 = create(:place, name: 'place3')
        create(:place_evaluation, place: place3, visited_on: Date.yesterday)

        sorted_places = Place.recently_visited

        aggregate_failures do
          expect(sorted_places.first.name).to eq(place1.name)
          expect(sorted_places.last.name).to  eq(place2.name)
        end
      end
    end
  end
end
