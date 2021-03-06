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

ActiveRecord::Schema.define(version: 20140118152831) do

  create_table "cities", force: true do |t|
    t.integer  "federal_state_id"
    t.string   "name"
    t.string   "slug"
    t.string   "zip_code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cities", ["federal_state_id"], name: "index_cities_on_federal_state_id"
  add_index "cities", ["slug"], name: "index_cities_on_slug"

  create_table "countries", force: true do |t|
    t.string   "name"
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "countries", ["slug"], name: "index_countries_on_slug"

  create_table "days", force: true do |t|
    t.date     "value"
    t.string   "slug"
    t.integer  "month_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "day_of_month"
    t.integer  "wday"
  end

  add_index "days", ["month_id"], name: "index_days_on_month_id"
  add_index "days", ["slug"], name: "index_days_on_slug"

  create_table "federal_states", force: true do |t|
    t.integer  "country_id"
    t.string   "name"
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "federal_states", ["country_id"], name: "index_federal_states_on_country_id"
  add_index "federal_states", ["slug"], name: "index_federal_states_on_slug"

  create_table "months", force: true do |t|
    t.integer  "value"
    t.string   "slug"
    t.integer  "year_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "months", ["slug"], name: "index_months_on_slug"
  add_index "months", ["year_id"], name: "index_months_on_year_id"

  create_table "schools", force: true do |t|
    t.integer  "city_id"
    t.string   "name"
    t.string   "slug"
    t.string   "address_line1"
    t.string   "address_line2"
    t.string   "street"
    t.string   "zip_code"
    t.string   "city"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "schools", ["city_id"], name: "index_schools_on_city_id"
  add_index "schools", ["slug"], name: "index_schools_on_slug"

  create_table "slots", force: true do |t|
    t.integer  "day_id"
    t.string   "slotable_type"
    t.integer  "slotable_id"
    t.integer  "vacation_type_id"
    t.string   "description"
    t.integer  "vacation_period_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "slots", ["day_id"], name: "index_slots_on_day_id"
  add_index "slots", ["slotable_id"], name: "index_slots_on_slotable_id"
  add_index "slots", ["slotable_type"], name: "index_slots_on_slotable_type"
  add_index "slots", ["vacation_period_id"], name: "index_slots_on_vacation_period_id"
  add_index "slots", ["vacation_type_id"], name: "index_slots_on_vacation_type_id"

  create_table "vacation_periods", force: true do |t|
    t.date     "start_date"
    t.date     "end_date"
    t.string   "vacation_periodable_type"
    t.integer  "vacation_periodable_id"
    t.integer  "vacation_type_id"
    t.string   "description"
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "vacation_periods", ["vacation_periodable_id"], name: "index_vacation_periods_on_vacation_periodable_id"
  add_index "vacation_periods", ["vacation_periodable_type"], name: "index_vacation_periods_on_vacation_periodable_type"

  create_table "vacation_types", force: true do |t|
    t.string   "name"
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "public_holiday"
  end

  add_index "vacation_types", ["slug"], name: "index_vacation_types_on_slug"

  create_table "years", force: true do |t|
    t.integer  "value"
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "years", ["slug"], name: "index_years_on_slug"

end
