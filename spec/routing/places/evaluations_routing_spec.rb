require 'rails_helper'

RSpec.describe Places::EvaluationsController, type: :routing do
  describe 'routing' do
    let(:place) { create(:place) }

    it 'routes to #new' do
      expect(get: "/places/#{place.id}/evaluations/new").to route_to('places/evaluations#new', place_id: place.id.to_s)
    end

    it 'routes to #create' do
      expect(post: "/places/#{place.id}/evaluations").to route_to('places/evaluations#create', place_id: place.id.to_s)
    end
  end
end
