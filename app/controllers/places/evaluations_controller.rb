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

  def edit
    @place = Place.find(params[:place_id])
    @evaluation = @place.evaluations.find(params[:id])
  end

  def update
    @place = Place.find(params[:place_id])
    @evaluation = @place.evaluations.find(params[:id])

    if @evaluation.update(evaluation_params)
      redirect_to place_path(@place), notice: 'Evaluation was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @place = Place.find(params[:place_id])
    @evaluation = @place.evaluations.find(params[:id])
    if @evaluation.destroy
      redirect_to place_path(@place), notice: '訪問記録を削除しました'
    else
      redirect_to place_path(@place), alert: '訪問記録の削除に失敗しました'
    end
  end

  private

  def evaluation_params
    params.require(:place_evaluation).permit(:visited_on, :point)
  end
end
