class PlacesController < ApplicationController
  def show
    @place = VisitedPlace.find(params[:id])
    @place_evaluations = @place.reports.order(visited_on: :desc)
  end

  def edit
    @place = VisitedPlace.find(params[:id])
  end

  def update
    @place = VisitedPlace.find(params[:id])

    respond_to do |format|
      if @place.update(visited_place_params)
        format.html { redirect_to place_path(@place), notice: "#{I18n.t('activerecord.models.visited_place')}の更新しました" }
        format.json { render :show, status: :ok, location: place_path(@place.id) }
      else
        format.html { render :edit }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def visited_place_params
    params.require(:visited_place).permit(:name, :address)
  end
end
