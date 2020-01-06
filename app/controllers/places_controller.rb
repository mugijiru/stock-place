class PlacesController < ApplicationController
  def show
    @place = Place.find(params[:id])
    @place_evaluations = @place.evaluations.order(visited_on: :desc)
  end
end
