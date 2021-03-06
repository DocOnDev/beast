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

ActiveRecord::Schema.define(version: 20160604001529) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "diaries", force: :cascade do |t|
    t.date     "date"
    t.text     "narrative"
    t.integer  "sleep_score"
    t.float    "body_weight"
    t.integer  "step_count"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
  end

  add_index "diaries", ["user_id"], name: "index_diaries_on_user_id", using: :btree

  create_table "diets", force: :cascade do |t|
    t.date     "start_date"
    t.date     "end_date"
    t.string   "description"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "diets", ["user_id"], name: "index_diets_on_user_id", using: :btree

  create_table "entries", force: :cascade do |t|
    t.integer  "food_group_id"
    t.string   "username"
    t.date     "date"
    t.decimal  "portion"
    t.string   "description"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "user_id"
  end

  add_index "entries", ["food_group_id"], name: "index_entries_on_food_group_id", using: :btree
  add_index "entries", ["user_id"], name: "index_entries_on_user_id", using: :btree

  create_table "food_groups", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "calories"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "intakes", force: :cascade do |t|
    t.integer  "diet_id"
    t.integer  "food_group_id"
    t.integer  "quantity"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "nutritional_values", force: :cascade do |t|
    t.integer  "recipe_id"
    t.integer  "food_group_id"
    t.decimal  "quantity"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "recipes", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "web_page"
    t.decimal  "quantity"
    t.string   "unit"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "time_zone"
    t.string   "first_name"
    t.string   "last_name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "diaries", "users"
  add_foreign_key "diets", "users"
  add_foreign_key "entries", "food_groups"
  add_foreign_key "entries", "users"
end
