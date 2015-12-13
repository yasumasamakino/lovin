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

ActiveRecord::Schema.define(version: 20151213041015) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace",     limit: 255
    t.text     "body",          limit: 65535
    t.string   "resource_id",   limit: 255,   null: false
    t.string   "resource_type", limit: 255,   null: false
    t.integer  "author_id",     limit: 4
    t.string   "author_type",   limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "age_groups", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "areas", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "event_descriptions", force: :cascade do |t|
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "event_id",    limit: 4
    t.string   "title",       limit: 255
    t.integer  "disp_order",  limit: 4
  end

  add_index "event_descriptions", ["event_id"], name: "index_event_descriptions_on_event_id", using: :btree

  create_table "events", force: :cascade do |t|
    t.string   "title",              limit: 255
    t.string   "sub_title",          limit: 255
    t.string   "teiin",              limit: 255
    t.datetime "kaisai_date"
    t.string   "kaisai_place",       limit: 255
    t.text     "notice",             limit: 65535
    t.string   "food",               limit: 255
    t.string   "drink",              limit: 255
    t.datetime "cancellation_date"
    t.string   "clothes",            limit: 255
    t.string   "belongings",         limit: 255
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "organizer_id",       limit: 4
    t.integer  "ageGroup_id",        limit: 4
    t.integer  "prefecture_id",      limit: 4
    t.integer  "area_id",            limit: 4
    t.date     "kaisai_date_search"
  end

  add_index "events", ["ageGroup_id"], name: "index_events_on_ageGroup_id", using: :btree
  add_index "events", ["area_id"], name: "index_events_on_area_id", using: :btree
  add_index "events", ["organizer_id"], name: "index_events_on_organizer_id", using: :btree
  add_index "events", ["prefecture_id"], name: "index_events_on_prefecture_id", using: :btree

  create_table "organizers", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "prefectures", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_foreign_key "event_descriptions", "events"
  add_foreign_key "events", "areas"
  add_foreign_key "events", "organizers"
  add_foreign_key "events", "prefectures"
end
