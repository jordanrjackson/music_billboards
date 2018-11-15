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

ActiveRecord::Schema.define(version: 2018_11_15_224538) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "artists", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "billboards", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "songs", force: :cascade do |t|
    t.string "name"
    t.string "artist"
    t.string "description"
    t.string "release"
    t.string "year"
    t.bigint "artists_id"
    t.bigint "billboards_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artists_id"], name: "index_songs_on_artists_id"
    t.index ["billboards_id"], name: "index_songs_on_billboards_id"
  end

  add_foreign_key "songs", "artists", column: "artists_id"
  add_foreign_key "songs", "billboards", column: "billboards_id"
end
