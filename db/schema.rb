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

ActiveRecord::Schema.define(version: 20190103145532) do

  create_table "advertisers", force: :cascade do |t|
    t.string   "uuid",       limit: 255
    t.string   "title",      limit: 255
    t.text     "details",    limit: 65535
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "integer_id", limit: 4
  end

  add_index "advertisers", ["uuid"], name: "index_advertisers_on_uuid", unique: true, using: :btree

  create_table "events", force: :cascade do |t|
    t.date     "event_date"
    t.time     "starts_at"
    t.time     "ends_at"
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "uuid",       limit: 255
    t.integer  "integer_id", limit: 4
    t.string   "content",    limit: 255
  end

  add_index "events", ["uuid"], name: "index_events_on_uuid", unique: true, using: :btree

  create_table "overlaps", force: :cascade do |t|
    t.string   "event_id",     limit: 255
    t.string   "overlaper_id", limit: 255
    t.string   "uuid",         limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "integer_id",   limit: 4
  end

  add_index "overlaps", ["event_id"], name: "index_overlaps_on_event_id", using: :btree
  add_index "overlaps", ["overlaper_id"], name: "index_overlaps_on_overlaper_id", using: :btree
  add_index "overlaps", ["uuid"], name: "index_overlaps_on_uuid", unique: true, using: :btree

  create_table "uploads", force: :cascade do |t|
    t.string   "uploadable_id",           limit: 255
    t.string   "uploadable_type",         limit: 255
    t.string   "attachment_type",         limit: 255
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "attachment_file_name",    limit: 255
    t.string   "attachment_content_type", limit: 255
    t.integer  "attachment_file_size",    limit: 8
    t.datetime "attachment_updated_at"
  end

  add_index "uploads", ["uploadable_id"], name: "index_uploads_on_uploadable_id", using: :btree
  add_index "uploads", ["uploadable_type"], name: "index_uploads_on_uploadable_type", using: :btree

end
