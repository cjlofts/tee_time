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

ActiveRecord::Schema.define(version: 20150501003127) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "game_players", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "game_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "game_players", ["game_id"], name: "index_game_players_on_game_id", using: :btree
  add_index "game_players", ["user_id"], name: "index_game_players_on_user_id", using: :btree

  create_table "games", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "golf_course_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.datetime "date"
  end

  add_index "games", ["golf_course_id"], name: "index_games_on_golf_course_id", using: :btree
  add_index "games", ["user_id"], name: "index_games_on_user_id", using: :btree

  create_table "golf_courses", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "golf_courses", ["user_id"], name: "index_golf_courses_on_user_id", using: :btree

  create_table "invitations", force: :cascade do |t|
    t.integer  "invited_user_id"
    t.integer  "user_id"
    t.integer  "game_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "invitations", ["game_id"], name: "index_invitations_on_game_id", using: :btree
  add_index "invitations", ["user_id"], name: "index_invitations_on_user_id", using: :btree

  create_table "requests", force: :cascade do |t|
    t.integer  "requested_user_id"
    t.integer  "user_id"
    t.integer  "game_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "requests", ["game_id"], name: "index_requests_on_game_id", using: :btree
  add_index "requests", ["user_id"], name: "index_requests_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.integer  "age"
    t.string   "phone_number"
    t.integer  "handicap"
    t.text     "description"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
  end

  add_foreign_key "game_players", "games"
  add_foreign_key "game_players", "users"
  add_foreign_key "games", "golf_courses"
  add_foreign_key "games", "users"
  add_foreign_key "golf_courses", "users"
  add_foreign_key "invitations", "games"
  add_foreign_key "invitations", "users"
  add_foreign_key "requests", "games"
  add_foreign_key "requests", "users"
end
