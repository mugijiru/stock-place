class VisitedPlaces::ReportsController < ApplicationController
  def new
    @place = VisitedPlace.find(params[:visited_place_id])
    @report = @place.reports.build
  end

  def create
    @place = VisitedPlace.find(params[:visited_place_id])
    @report = @place.reports.build(visited_place_report_params)

    if @report.save
      redirect_to visited_place_path(@place), notice: "#{I18n.t('activerecord.models.visited_place_report')}を登録しました"
    else
      render :new
    end
  end

  def edit
    @place = VisitedPlace.find(params[:visited_place_id])
    @report = @place.reports.find(params[:id])
  end

  def update
    @place = VisitedPlace.find(params[:visited_place_id])
    @report = @place.reports.find(params[:id])

    if @report.update(visited_place_report_params)
      redirect_to visited_place_path(@place), notice: "#{I18n.t('activerecord.models.visited_place_report')}を更新しました"
    else
      render :edit
    end
  end

  def destroy
    @place = VisitedPlace.find(params[:visited_place_id])
    @report = @place.reports.find(params[:id])
    if @report.destroy
      redirect_to visited_place_path(@place), notice: '訪問記録を削除しました'
    else
      redirect_to visited_place_path(@place), alert: '訪問記録の削除に失敗しました'
    end
  end

  private

  def visited_place_report_params
    params.require(:visited_place_report).permit(:visited_on, :evaluation)
  end
end
