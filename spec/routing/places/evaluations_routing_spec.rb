require 'rails_helper'

RSpec.describe Places::EvaluationsController, type: :routing do
  describe 'routing' do
    let(:place) { create(:visited_place) }

    it 'routes to #new' do
      expect(get: "/visited_places/#{place.id}/evaluations/new").to route_to('places/evaluations#new', visited_place_id: place.id.to_s)
    end

    it 'routes to #create' do
      expect(post: "/visited_places/#{place.id}/evaluations").to route_to('places/evaluations#create', visited_place_id: place.id.to_s)
    end
  end
end
