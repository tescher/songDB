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

ActiveRecord::Schema.define(version: 20161202040543) do

  create_table "column_transforms", force: :cascade do |t|
    t.string   "external"
    t.string   "internal"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "songs", force: :cascade do |t|
    t.string   "artist"
    t.string   "artist_last_name"
    t.string   "album"
    t.string   "category"
    t.string   "year"
    t.string   "intro"
    t.string   "cue_in_time"
    t.string   "segue_time"
    t.string   "bpm"
    t.string   "volume"
    t.string   "path"
    t.string   "mixer_memory"
    t.string   "file_id"
    t.string   "pitch"
    t.string   "play_count"
    t.string   "last_played"
    t.string   "hot_key"
    t.string   "fade_override"
    t.string   "notes"
    t.string   "vocalist"
    t.string   "ending_type"
    t.string   "restrict_play_enabled"
    t.string   "start_date"
    t.string   "stop_date"
    t.string   "related_artist"
    t.string   "composer"
    t.string   "lyricist"
    t.string   "publisher"
    t.string   "record_id"
    t.string   "highest_chart"
    t.string   "popularity"
    t.string   "energy_mood"
    t.string   "unique_id"
    t.string   "color"
    t.string   "color_on"
    t.string   "ss"
    t.string   "ssrow"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "title"
    t.boolean  "flag"
    t.string   "how"
  end

  add_index "songs", ["album"], name: "index_songs_on_album"
  add_index "songs", ["artist"], name: "index_songs_on_artist"
  add_index "songs", ["title"], name: "index_songs_on_title"

end
