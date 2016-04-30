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

ActiveRecord::Schema.define(version: 20160131210155) do

  create_table "actings", force: :cascade do |t|
    t.integer  "actor_id",   limit: 4
    t.integer  "movie_id",   limit: 4
    t.string   "role",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "actors", force: :cascade do |t|
    t.string "name",        limit: 255
    t.text   "description", limit: 65535
    t.string "image_url",   limit: 255
    t.date   "birthdate"
    t.string "birthplace",  limit: 255
  end

  create_table "directors", force: :cascade do |t|
    t.string "name",        limit: 255
    t.string "image_url",   limit: 255
    t.text   "description", limit: 65535
    t.date   "birthdate"
    t.string "birthplace",  limit: 255
  end

  create_table "genres", force: :cascade do |t|
    t.string "name", limit: 255
  end

  create_table "movies", force: :cascade do |t|
    t.string  "name",         limit: 255
    t.text    "description",  limit: 65535
    t.string  "image_url",    limit: 255
    t.date    "release_date"
    t.integer "director_id",  limit: 4
    t.float   "rating",       limit: 24
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "user_id",     limit: 4
    t.integer  "movie_id",    limit: 4
    t.string   "description", limit: 255
    t.integer  "rating",      limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "reviews", ["movie_id"], name: "index_reviews_on_movie_id", using: :btree
  add_index "reviews", ["user_id"], name: "index_reviews_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name",               limit: 255
    t.string   "email",              limit: 255, null: false
    t.string   "encrypted_password", limit: 255, null: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

  create_table "watchlists", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "movie_id",   limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "watchlists", ["movie_id"], name: "index_watchlists_on_movie_id", using: :btree
  add_index "watchlists", ["user_id"], name: "index_watchlists_on_user_id", using: :btree

  add_foreign_key "reviews", "movies"
  add_foreign_key "reviews", "users"
  add_foreign_key "watchlists", "movies"
  add_foreign_key "watchlists", "users"
end
