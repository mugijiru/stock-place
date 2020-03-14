require 'rails_helper'

RSpec.describe VisitedPlaces::ReportsController, type: :routing do
  describe 'routing' do
    let(:place) { create(:visited_place) }

    it 'routes to #new' do
      expect(get: "/visited_places/#{place.id}/reports/new").to route_to('visited_places/reports#new', visited_place_id: place.id.to_s)
    end

    it 'routes to #create' do
      expect(post: "/visited_places/#{place.id}/reports").to route_to('visited_places/reports#create', visited_place_id: place.id.to_s)
    end
  end
end
