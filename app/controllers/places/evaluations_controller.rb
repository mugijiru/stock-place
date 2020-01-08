class Places::EvaluationsController < ApplicationController
  def create
    @place = Place.find(params[:place_id])

    if @place.evaluations.create(evaluation_params)
      redirect_to place_path(@place), notice: 'Evaluation was successfully created.'
    else
      render :new
    end
  end

  private

  def evaluation_params
    params.require(:evaluation).permit(:visited_on, :point)
  end
end
