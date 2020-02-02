# == Schema Information
#
# Table name: places
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  address    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe VisitedPlace, type: :model do
  describe 'finder methods' do
    describe 'recently_visited' do
      it '最後に訪問した順の降順で返って来ること' do
        place1 = create(:visited_place, name: 'place1')
        create(:visited_place_report, visited_place: place1, visited_on: Date.today)
        place2 = create(:visited_place, name: 'place2')
        create(:visited_place_report, visited_place: place2, visited_on: Date.today - 2.days)
        place3 = create(:visited_place, name: 'place3')
        create(:visited_place_report, visited_place: place3, visited_on: Date.yesterday)

        sorted_places = VisitedPlace.recently_visited

        aggregate_failures do
          expect(sorted_places.first.name).to eq(place1.name)
          expect(sorted_places.last.name).to  eq(place2.name)
        end
      end
    end
  end
end
