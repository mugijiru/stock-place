class Api::V1::PlaceEvaluationsController < ApplicationController
  def create
    place_report = VisitedPlaceReport.new(place_evaluation_params)

    if place_report.save
      render json: place_report.to_json, status: :created
    else
      render json: { errors: place_report.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def place_evaluation_params
    params.require(:place_evaluation).permit(:visited_place_id, :visited_on, :evaluation)
  end
end
