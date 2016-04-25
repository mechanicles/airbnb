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

ActiveRecord::Schema.define(version: 20160425145703) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string   "street1"
    t.string   "street2"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.integer  "addressable_id"
    t.string   "addressable_type"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "addresses", ["addressable_type", "addressable_id"], name: "index_addresses_on_addressable_type_and_addressable_id", using: :btree

  create_table "shared_office_spaces", force: :cascade do |t|
    t.integer  "user_id",                          null: false
    t.integer  "space_id",                         null: false
    t.boolean  "publicly_shared",   default: true
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "period"
    t.datetime "period_start_date"
    t.datetime "period_end_date"
    t.boolean  "recurring"
  end

  add_index "shared_office_spaces", ["space_id"], name: "index_shared_office_spaces_on_space_id", using: :btree
  add_index "shared_office_spaces", ["user_id"], name: "index_shared_office_spaces_on_user_id", using: :btree

  create_table "spaces", force: :cascade do |t|
    t.string   "name",                                    null: false
    t.text     "description"
    t.integer  "total_seats"
    t.string   "start_time"
    t.string   "end_time"
    t.text     "amenities",               default: [],                 array: true
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.integer  "user_id"
    t.text     "pictures",                default: [],                 array: true
    t.boolean  "featured",                default: false
    t.float    "cost_per_seat_per_day"
    t.float    "cost_per_seat_per_week"
    t.float    "cost_per_seat_per_month"
  end

  add_index "spaces", ["user_id"], name: "index_spaces_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
    t.string   "phone_number"
    t.string   "company_name"
    t.string   "role"
    t.string   "provider"
    t.string   "uid"
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "shared_office_spaces", "spaces"
  add_foreign_key "shared_office_spaces", "users"
  add_foreign_key "spaces", "users"
end
