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

ActiveRecord::Schema.define(version: 2020_02_02_215244) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "data_points", force: :cascade do |t|
    t.bigint "playlist_id"
    t.float "video_engagement_100"
    t.float "video_engagement_75"
    t.float "video_engagement_50"
    t.float "video_engagement_25"
    t.integer "video_seconds_viewed"
    t.integer "video_impression"
    t.float "engagement_score"
    t.float "video_engagement_1"
    t.float "video_percent_viewed"
    t.integer "play_request"
    t.integer "video_view"
    t.float "play_rate"
    t.datetime "created_at", null: false
    t.index ["playlist_id"], name: "index_data_points_on_playlist_id"
  end

  create_table "playlists", id: false, force: :cascade do |t|
    t.string "id"
    t.string "account_id", null: false
    t.string "name", null: false
    t.string "video_ids", array: true
    t.string "playlist_type"
    t.string "description"
    t.string "reference_id"
    t.boolean "favorite"
    t.integer "limit"
    t.string "search"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
