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

ActiveRecord::Schema.define(version: 20150725211832) do

  create_table "addresses", force: :cascade do |t|
    t.string   "description", limit: 255
    t.boolean  "state",       limit: 1
    t.text     "reference",   limit: 65535
    t.integer  "district_id", limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "addresses", ["district_id"], name: "index_addresses_on_district_id", using: :btree

  create_table "districts", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "favorites", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "person_id",  limit: 4
    t.integer  "address_id", limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "favorites", ["address_id"], name: "index_favorites_on_address_id", using: :btree
  add_index "favorites", ["person_id"], name: "index_favorites_on_person_id", using: :btree

  create_table "payment_types", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "people", force: :cascade do |t|
    t.string   "first_name", limit: 255
    t.string   "last_name",  limit: 255
    t.string   "dni",        limit: 255
    t.string   "license",    limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "service_types", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "vehicle_types", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "vehicles", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.text     "description",     limit: 65535
    t.integer  "seats_capacity",  limit: 4
    t.string   "plate",           limit: 255
    t.string   "year",            limit: 255
    t.string   "brand",           limit: 255
    t.string   "soat",            limit: 255
    t.integer  "vehicle_type_id", limit: 4
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "vehicles", ["vehicle_type_id"], name: "index_vehicles_on_vehicle_type_id", using: :btree

  create_table "vehicletypes", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_foreign_key "addresses", "districts"
  add_foreign_key "favorites", "addresses"
  add_foreign_key "favorites", "people"
  add_foreign_key "vehicles", "vehicle_types"
end
