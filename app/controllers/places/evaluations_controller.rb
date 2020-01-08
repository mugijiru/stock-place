class Places::EvaluationsController < ApplicationController
  def new
    @place = Place.find(params[:place_id])
    @evaluation = @place.evaluations.build
  end

  def create
    @place = Place.find(params[:place_id])
    @evaluation = @place.evaluations.build(evaluation_params)

    if @evaluation.save
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
