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

ActiveRecord::Schema.define(version: 20140918180603) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contractors", force: true do |t|
    t.string   "name"
    t.string   "site_address"
    t.string   "site_city"
    t.string   "site_zip"
    t.string   "site_state"
    t.string   "naics_code"
    t.string   "insp_type"
    t.datetime "open_date"
    t.float    "total_current_penalty"
    t.boolean  "osha_violation_indicator"
    t.integer  "serious_violations"
    t.integer  "total_violations"
    t.datetime "loaded_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
