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

ActiveRecord::Schema.define(version: 2019_09_21_080451) do

  create_table "achievements", force: :cascade do |t|
    t.string "name"
    t.integer "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_achievements_on_name", unique: true
  end

  create_table "matches", force: :cascade do |t|
    t.string "name"
    t.string "city"
    t.integer "home_team_id"
    t.integer "guest_team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["guest_team_id"], name: "index_matches_on_guest_team_id"
    t.index ["home_team_id", "guest_team_id"], name: "index_matches_on_home_team_id_and_guest_team_id", unique: true
    t.index ["name"], name: "index_matches_on_name", unique: true
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.string "gender"
    t.integer "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_players_on_team_id"
  end

  create_table "ratings", force: :cascade do |t|
    t.integer "player_id"
    t.integer "achievement_id"
    t.integer "match_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["achievement_id"], name: "index_ratings_on_achievement_id"
    t.index ["match_id"], name: "index_ratings_on_match_id"
    t.index ["player_id", "achievement_id", "match_id"], name: "index_ratings_on_player_id_and_achievement_id_and_match_id", unique: true
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_teams_on_name", unique: true
  end

end
