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

ActiveRecord::Schema.define(version: 20160421021632) do

  create_table "calendars", force: :cascade do |t|
    t.date     "day"
    t.boolean  "dayoff"
    t.boolean  "holiday"
    t.integer  "corperation_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "cdkeys", force: :cascade do |t|
    t.string   "key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "mac"
  end

  create_table "corperations", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
    t.string   "mac"
  end

  create_table "departments", force: :cascade do |t|
    t.string   "name"
    t.integer  "corperation_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "departments", ["corperation_id"], name: "index_departments_on_corperation_id"

  create_table "employees", force: :cascade do |t|
    t.string   "name"
    t.integer  "department_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "mac"
  end

  add_index "employees", ["department_id"], name: "index_employees_on_department_id"

# Could not dump table "get_macs" because of following NoMethodError
#   undefined method `[]' for nil:NilClass

  create_table "key_validates", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "key"
  end

  create_table "messages", force: :cascade do |t|
    t.string   "mobile"
    t.string   "seccode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mobile_validates", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "mobile"
  end

  create_table "password_resets", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "send_messages", force: :cascade do |t|
    t.string   "mobile"
    t.string   "seccode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "time_sets", force: :cascade do |t|
    t.integer  "corperation_id"
    t.float    "start"
    t.float    "arrive"
    t.float    "late"
    t.float    "run"
    t.float    "leave"
    t.float    "finish"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "time_sets", ["corperation_id"], name: "index_time_sets_on_corperation_id"

  create_table "users", force: :cascade do |t|
    t.string   "mobile"
    t.string   "message"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.string   "authentication_token"
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
    t.string   "key"
  end

  add_index "users", ["mobile"], name: "index_users_on_mobile", unique: true

end
