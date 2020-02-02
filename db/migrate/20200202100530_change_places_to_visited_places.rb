class ChangePlacesToVisitedPlaces < ActiveRecord::Migration[6.0]
  def change
    rename_table :places, :visited_places
  end
end
