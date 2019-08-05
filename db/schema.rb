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

ActiveRecord::Schema.define(version: 2016_12_11_024245) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "meeting_spaces", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "session_history", force: :cascade do |t|
    t.bigint "session_id"
    t.string "title"
    t.string "owner"
    t.string "twitter_handle"
    t.bigint "time_slot_id"
    t.bigint "meeting_space_id"
    t.string "operation"
    t.datetime "action_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["meeting_space_id"], name: "index_session_history_on_meeting_space_id"
    t.index ["session_id"], name: "index_session_history_on_session_id"
    t.index ["time_slot_id"], name: "index_session_history_on_time_slot_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.string "title"
    t.string "owner"
    t.string "twitter_handle"
    t.bigint "time_slot_id"
    t.bigint "meeting_space_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["meeting_space_id"], name: "index_sessions_on_meeting_space_id"
    t.index ["time_slot_id"], name: "index_sessions_on_time_slot_id"
  end

  create_table "time_slots", force: :cascade do |t|
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "enabled", default: true
  end

  add_foreign_key "session_history", "meeting_spaces"
  add_foreign_key "session_history", "time_slots"
  add_foreign_key "sessions", "meeting_spaces"
  add_foreign_key "sessions", "time_slots"
end
