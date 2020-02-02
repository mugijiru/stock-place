# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_02_02_100622) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "place_items", force: :cascade do |t|
    t.bigint "place_id", null: false
    t.string "name", null: false
    t.integer "price", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["place_id"], name: "index_place_items_on_place_id"
  end

  create_table "visited_place_reports", force: :cascade do |t|
    t.bigint "place_id", null: false
    t.date "visited_on", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.integer "point", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["place_id"], name: "index_visited_place_reports_on_place_id"
  end

  create_table "visited_places", force: :cascade do |t|
    t.string "name", null: false
    t.string "address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "place_items", "visited_places", column: "place_id"
  add_foreign_key "visited_place_reports", "visited_places", column: "place_id"
end
