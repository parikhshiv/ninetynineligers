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

ActiveRecord::Schema.define(version: 20150915214338) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "liger_rental_requests", force: :cascade do |t|
    t.integer "liger_id",                       null: false
    t.date    "start_date",                     null: false
    t.date    "end_date",                       null: false
    t.string  "status",     default: "PENDING"
  end

  add_index "liger_rental_requests", ["liger_id"], name: "index_liger_rental_requests_on_liger_id", using: :btree

  create_table "ligers", force: :cascade do |t|
    t.date     "birth_date",            null: false
    t.string   "color"
    t.string   "name",                  null: false
    t.string   "sex",         limit: 1
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
