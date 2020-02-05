class ChangeColumnNamesInVisitedPlaceReports < ActiveRecord::Migration[6.0]
  def change
    change_table :visited_place_reports, bulk: true do |t|
      t.rename :place_id, :visited_place_id
      t.rename :point, :evaluation
    end
  end
end
