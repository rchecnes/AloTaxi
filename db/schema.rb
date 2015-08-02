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

ActiveRecord::Schema.define(version: 20150802164543) do

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

  create_table "rates", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.float    "price",           limit: 24
    t.integer  "district_id",     limit: 4
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "from_address_id", limit: 4
    t.integer  "to_address_id",   limit: 4
    t.integer  "service_type_id", limit: 4
  end

  add_index "rates", ["district_id"], name: "index_rates_on_district_id", using: :btree
  add_index "rates", ["from_address_id"], name: "index_rates_on_from_address_id", using: :btree
  add_index "rates", ["service_type_id"], name: "index_rates_on_service_type_id", using: :btree
  add_index "rates", ["to_address_id"], name: "index_rates_on_to_address_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "seed_migration_data_migrations", force: :cascade do |t|
    t.string   "version",     limit: 255
    t.integer  "runtime",     limit: 4
    t.datetime "migrated_on"
  end

  create_table "service_types", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "services", force: :cascade do |t|
    t.string   "phase",           limit: 255
    t.datetime "reserved_at"
    t.datetime "confirmed_at"
    t.datetime "cancelled_at"
    t.datetime "scheduled_to"
    t.integer  "requested_seats", limit: 4
    t.datetime "started_at"
    t.datetime "ended_at"
    t.float    "price",           limit: 24
    t.integer  "vehicle_id",      limit: 4
    t.integer  "service_type_id", limit: 4
    t.integer  "payment_type_id", limit: 4
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "from_address_id", limit: 4
    t.integer  "to_address_id",   limit: 4
    t.integer  "customer_id",     limit: 4
    t.integer  "driver_id",       limit: 4
    t.integer  "vehicle_type_id", limit: 4
  end

  add_index "services", ["customer_id"], name: "index_services_on_customer_id", using: :btree
  add_index "services", ["driver_id"], name: "index_services_on_driver_id", using: :btree
  add_index "services", ["from_address_id"], name: "index_services_on_from_address_id", using: :btree
  add_index "services", ["payment_type_id"], name: "index_services_on_payment_type_id", using: :btree
  add_index "services", ["service_type_id"], name: "index_services_on_service_type_id", using: :btree
  add_index "services", ["to_address_id"], name: "index_services_on_to_address_id", using: :btree
  add_index "services", ["vehicle_id"], name: "index_services_on_vehicle_id", using: :btree
  add_index "services", ["vehicle_type_id"], name: "index_services_on_vehicle_type_id", using: :btree

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
  add_foreign_key "services", "payment_types"
  add_foreign_key "services", "service_types"
  add_foreign_key "services", "vehicle_types"
  add_foreign_key "services", "vehicles"
  add_foreign_key "vehicles", "vehicle_types"
end
