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

ActiveRecord::Schema.define(version: 2020_10_13_154827) do

  create_table "tourists", force: :cascade do |t|
    t.string "name"
    t.string "hometown"
    t.boolean "ticket_paid"
    t.integer "tour_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["tour_id"], name: "index_tourists_on_tour_id"
  end

  create_table "tours", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.string "activities"
    t.float "cost"
    t.time "start_time"
    t.time "end_time"
    t.date "tour_date"
    t.boolean "full"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "tourists", "tours"
end
