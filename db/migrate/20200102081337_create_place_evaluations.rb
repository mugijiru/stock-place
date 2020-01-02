class CreatePlaceEvaluations < ActiveRecord::Migration[6.0]
  def change
    create_table :place_evaluations do |t|
      t.belongs_to :place, null: false, foreign_key: true
      t.date :visited_on, null: false, default: -> { 'CURRENT_TIMESTAMP' }
      t.integer :point, null: false, default: 0

      t.timestamps
    end
  end
end
