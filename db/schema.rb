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

ActiveRecord::Schema.define(version: 20160916202226) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "juke_tracks", force: :cascade do |t|
    t.integer  "track_id"
    t.integer  "party_id"
    t.boolean  "import"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean  "active"
    t.index ["party_id"], name: "index_juke_tracks_on_party_id", using: :btree
    t.index ["track_id"], name: "index_juke_tracks_on_track_id", using: :btree
  end

  create_table "memberships", force: :cascade do |t|
    t.integer "user_id"
    t.integer "party_id"
    t.boolean "host"
    t.index ["party_id"], name: "index_memberships_on_party_id", using: :btree
    t.index ["user_id"], name: "index_memberships_on_user_id", using: :btree
  end

  create_table "parties", force: :cascade do |t|
    t.string  "name"
    t.integer "threshold"
    t.string  "spotify_playlist_id"
    t.string  "playlist_owner_id"
  end

  create_table "tracks", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "spotify_id"
    t.string   "name"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "token"
    t.string "refresh_token"
    t.string "spotify_id"
  end

  create_table "votes", force: :cascade do |t|
    t.integer "user_id"
    t.integer "juke_track_id"
    t.integer "value"
    t.index ["juke_track_id"], name: "index_votes_on_juke_track_id", using: :btree
    t.index ["user_id"], name: "index_votes_on_user_id", using: :btree
  end

end
