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

ActiveRecord::Schema.define(version: 20150924024034) do

  create_table "baskets", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "food_id"
    t.string   "food_course"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "baskets", ["food_id", "user_id", "food_course"], name: "index_baskets_on_food_id_and_user_id_and_food_course", unique: true
  add_index "baskets", ["food_id", "user_id"], name: "index_baskets_on_food_id_and_user_id", unique: true
  add_index "baskets", ["user_id", "food_course"], name: "index_baskets_on_user_id_and_food_course", unique: true

  create_table "foods", force: :cascade do |t|
    t.string   "name"
    t.decimal  "price"
    t.string   "course"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "in_menu",    default: false
  end

  create_table "menu_foods", force: :cascade do |t|
    t.integer  "menu_id"
    t.integer  "food_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "menu_foods", ["food_id", "menu_id"], name: "index_menu_foods_on_food_id_and_menu_id", unique: true

  create_table "menus", force: :cascade do |t|
    t.string   "weekday"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_foods", force: :cascade do |t|
    t.integer "order_id"
    t.integer "food_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string "role"
  end

  add_index "roles", ["role"], name: "index_roles_on_role", unique: true

  create_table "user_roles", force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "user_roles", ["role_id"], name: "index_users_roles_on_role_id"
  add_index "user_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", unique: true
  add_index "user_roles", ["user_id"], name: "index_users_roles_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
