class CreatePlaceItems < ActiveRecord::Migration[6.0]
  def change
    create_table :place_items do |t|
      t.belongs_to :place, null: false, foreign_key: true
      t.string :name, null: false
      t.integer :price, null: false, default: 0

      t.timestamps
    end
  end
end
