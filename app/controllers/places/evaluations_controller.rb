class Places::EvaluationsController < ApplicationController
  def new
    @place = VisitedPlace.find(params[:place_id])
    @evaluation = @place.reports.build
  end

  def create
    @place = VisitedPlace.find(params[:place_id])
    @evaluation = @place.reports.build(visited_place_report_params)

    if @evaluation.save
      redirect_to place_path(@place), notice: "#{I18n.t('activerecord.models.visited_place_report')}を登録しました"
    else
      render :new
    end
  end

  def edit
    @place = VisitedPlace.find(params[:place_id])
    @evaluation = @place.reports.find(params[:id])
  end

  def update
    @place = VisitedPlace.find(params[:place_id])
    @evaluation = @place.reports.find(params[:id])

    if @evaluation.update(visited_place_report_params)
      redirect_to place_path(@place), notice: "#{I18n.t('activerecord.models.visited_place_report')}を更新しました"
    else
      render :edit
    end
  end

  def destroy
    @place = VisitedPlace.find(params[:place_id])
    @evaluation = @place.reports.find(params[:id])
    if @evaluation.destroy
      redirect_to place_path(@place), notice: '訪問記録を削除しました'
    else
      redirect_to place_path(@place), alert: '訪問記録の削除に失敗しました'
    end
  end

  private

  def visited_place_report_params
    params.require(:visited_place_report).permit(:visited_on, :evaluation)
  end
end
