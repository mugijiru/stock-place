class Api::V1::VisitedPlaceReportsController < ApplicationController
  def create
    @place_report = VisitedPlaceReport.new(visited_place_report_params)

    if @place_report.save
      render :show, status: :created
    else
      render json: { errors: @place_report.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def visited_place_report_params
    params.require(:visited_place_report).permit(:visited_place_id, :visited_on, :evaluation)
  end
end
