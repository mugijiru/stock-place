class Api::V1::PlaceEvaluationsController < ApplicationController
  def create
    place_evaluation = PlaceEvaluation.new(place_evaluation_params)

    if place_evaluation.save
      render json: place_evaluation.to_json, status: :created
    else
      render json: { errors: place_evaluation.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def place_evaluation_params
    params.require(:place_evaluation).permit(:place_id, :visited_on, :point)
  end
end
