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

ActiveRecord::Schema.define(version: 20140618032856) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "beers", force: true do |t|
    t.integer  "bid"
    t.string   "beer_name"
    t.float    "beer_abv"
    t.text     "beer_description"
    t.string   "beer_style"
    t.boolean  "is_in_production"
    t.integer  "rating_count"
    t.float    "rating_score"
    t.string   "brewery_id"
    t.string   "brewery_name"
    t.integer  "breweries_id"
    t.integer  "style_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "beers", ["breweries_id"], name: "index_beers_on_breweries_id", using: :btree
  add_index "beers", ["style_id"], name: "index_beers_on_style_id", using: :btree

  create_table "breweries", force: true do |t|
    t.integer  "brewery_id"
    t.string   "brewery_name"
    t.string   "brewery_city"
    t.string   "brewery_state"
    t.string   "country_name"
    t.float    "lat"
    t.float    "lng"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "checkins", force: true do |t|
    t.integer  "checkin_id"
    t.datetime "untappd_created_at"
    t.float    "rating_score"
    t.integer  "uid"
    t.string   "first_name"
    t.integer  "bid"
    t.string   "beer_name"
    t.integer  "brewery_id"
    t.string   "brewery_name"
    t.string   "venue_city"
    t.string   "venue_state"
    t.float    "lat"
    t.float    "lng"
    t.integer  "beer_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "checkins", ["beer_id"], name: "index_checkins_on_beer_id", using: :btree
  add_index "checkins", ["user_id"], name: "index_checkins_on_user_id", using: :btree

  create_table "styles", force: true do |t|
    t.string   "beer_style"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.integer  "untappd_id"
    t.string   "user_name"
    t.string   "first_name"
    t.string   "location"
    t.date     "birthday"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
