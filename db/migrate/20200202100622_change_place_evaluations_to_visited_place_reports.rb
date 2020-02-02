class ChangePlaceEvaluationsToVisitedPlaceReports < ActiveRecord::Migration[6.0]
  def change
    rename_table :place_evaluations, :visited_place_reports
  end
end
