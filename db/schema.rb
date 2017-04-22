# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170422013107) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "meeting_spaces", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "session_history", force: :cascade do |t|
    t.integer  "session_id"
    t.string   "title"
    t.string   "owner"
    t.string   "twitter_handle"
    t.integer  "time_slot_id"
    t.integer  "meeting_space_id"
    t.string   "operation"
    t.datetime "action_date"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "session_history", ["meeting_space_id"], name: "index_session_history_on_meeting_space_id", using: :btree
  add_index "session_history", ["time_slot_id"], name: "index_session_history_on_time_slot_id", using: :btree

  create_table "sessions", force: :cascade do |t|
    t.string   "title"
    t.string   "owner"
    t.string   "twitter_handle"
    t.integer  "time_slot_id"
    t.integer  "meeting_space_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "sessions", ["meeting_space_id"], name: "index_sessions_on_meeting_space_id", using: :btree
  add_index "sessions", ["time_slot_id"], name: "index_sessions_on_time_slot_id", using: :btree

  create_table "time_slots", force: :cascade do |t|
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.boolean  "enabled",    default: true
  end

  add_foreign_key "session_history", "meeting_spaces"
  add_foreign_key "session_history", "time_slots"
  add_foreign_key "sessions", "meeting_spaces"
  add_foreign_key "sessions", "time_slots"
end
