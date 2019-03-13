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

ActiveRecord::Schema.define(version: 20190312153609) do

  create_table "advertisers", force: :cascade do |t|
    t.string   "uuid",       limit: 255
    t.string   "title",      limit: 255
    t.text     "details",    limit: 65535
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "integer_id", limit: 4
    t.string   "p_type",     limit: 255
  end

  add_index "advertisers", ["uuid"], name: "index_advertisers_on_uuid", unique: true, using: :btree

  create_table "assignments", force: :cascade do |t|
    t.string   "task_id",    limit: 255
    t.integer  "user_id",    limit: 4
    t.string   "uuid",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "assignments", ["task_id"], name: "index_assignments_on_task_id", using: :btree
  add_index "assignments", ["uuid"], name: "index_assignments_on_uuid", using: :btree

  create_table "discussions", force: :cascade do |t|
    t.text     "content",    limit: 65535
    t.string   "uuid",       limit: 255
    t.integer  "tasks_id",   limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "discussions", ["uuid"], name: "index_discussions_on_uuid", unique: true, using: :btree

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

  create_table "milestones", force: :cascade do |t|
    t.string   "project_id", limit: 255
    t.string   "uuid",       limit: 255
    t.string   "title",      limit: 255
    t.text     "details",    limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "milestones", ["project_id"], name: "index_milestones_on_project_id", using: :btree
  add_index "milestones", ["uuid"], name: "index_milestones_on_uuid", unique: true, using: :btree

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

  create_table "participations", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.string   "project_id", limit: 255
    t.string   "uuid",       limit: 255
    t.string   "status_id",  limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "participations", ["project_id"], name: "index_participations_on_project_id", using: :btree
  add_index "participations", ["status_id"], name: "index_participations_on_status_id", using: :btree
  add_index "participations", ["uuid"], name: "index_participations_on_uuid", unique: true, using: :btree

  create_table "profiles", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "user_id",    limit: 4
    t.string   "uuid",       limit: 255
    t.integer  "integer_id", limit: 4
  end

  add_index "profiles", ["integer_id"], name: "index_profiles_on_integer_id", using: :btree
  add_index "profiles", ["uuid"], name: "index_profiles_on_uuid", unique: true, using: :btree

  create_table "projects", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.text     "details",    limit: 65535
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "uuid",       limit: 255
    t.integer  "integer_id", limit: 4
    t.string   "p_type",     limit: 255
  end

  add_index "projects", ["integer_id"], name: "index_projects_on_integer_id", using: :btree
  add_index "projects", ["uuid"], name: "index_projects_on_uuid", unique: true, using: :btree

  create_table "speardings", force: :cascade do |t|
    t.string   "event_id",        limit: 255
    t.string   "speardable_id",   limit: 255
    t.string   "speardable_type", limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "uuid",            limit: 255
  end

  add_index "speardings", ["event_id"], name: "index_speardings_on_event_id", using: :btree
  add_index "speardings", ["speardable_id"], name: "index_speardings_on_speardable_id", using: :btree
  add_index "speardings", ["speardable_type"], name: "index_speardings_on_speardable_type", using: :btree
  add_index "speardings", ["uuid"], name: "index_speardings_on_uuid", unique: true, using: :btree

  create_table "statuses", force: :cascade do |t|
    t.string   "scope_type",  limit: 255
    t.string   "title",       limit: 255
    t.string   "uuid",        limit: 255
    t.string   "next_id",     limit: 255
    t.string   "previous_id", limit: 255
    t.boolean  "start_point"
    t.boolean  "end_point"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "statuses", ["next_id"], name: "index_statuses_on_next_id", using: :btree
  add_index "statuses", ["previous_id"], name: "index_statuses_on_previous_id", using: :btree
  add_index "statuses", ["uuid"], name: "index_statuses_on_uuid", unique: true, using: :btree

  create_table "subscriptions", force: :cascade do |t|
    t.string   "advertiser_id", limit: 255
    t.integer  "user_id",       limit: 4
    t.string   "uuid",          limit: 255
    t.string   "status_id",     limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "subscriptions", ["advertiser_id"], name: "index_subscriptions_on_advertiser_id", using: :btree
  add_index "subscriptions", ["status_id"], name: "index_subscriptions_on_status_id", using: :btree
  add_index "subscriptions", ["uuid"], name: "index_subscriptions_on_uuid", unique: true, using: :btree

  create_table "tasks", force: :cascade do |t|
    t.string   "milestone_id",  limit: 255
    t.string   "uuid",          limit: 255
    t.string   "title",         limit: 255
    t.date     "deadline"
    t.integer  "user_id",       limit: 4
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.text     "details",       limit: 65535
    t.time     "deadline_time"
    t.string   "status_id",     limit: 255
  end

  add_index "tasks", ["milestone_id"], name: "index_tasks_on_milestone_id", using: :btree
  add_index "tasks", ["status_id"], name: "index_tasks_on_status_id", using: :btree
  add_index "tasks", ["uuid"], name: "index_tasks_on_uuid", unique: true, using: :btree

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

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string   "username",               limit: 255
    t.string   "mobile",                 limit: 255
    t.string   "fullname",               limit: 255
  end

  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
