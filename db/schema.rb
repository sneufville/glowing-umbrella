# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_06_26_175754) do
  create_table "electoral_wards", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "service_areas", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "service_requests", force: :cascade do |t|
    t.datetime "date"
    t.string "service_request"
    t.string "neighbourhood"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "electoral_ward_id", null: false
    t.integer "service_area_id", null: false
    t.index ["electoral_ward_id"], name: "index_service_requests_on_electoral_ward_id"
    t.index ["service_area_id"], name: "index_service_requests_on_service_area_id"
  end

  add_foreign_key "service_requests", "electoral_wards"
  add_foreign_key "service_requests", "service_areas"
end
