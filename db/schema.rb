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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 20160422153857) do
=======
ActiveRecord::Schema.define(version: 20160422001051) do
>>>>>>> ad05b8aeff1abbbec0e128f542d7dadfebced121

  create_table "comments", force: :cascade do |t|
    t.text    "description"
    t.string  "type"
    t.integer "users_id"
  end

  add_index "comments", ["users_id"], name: "index_comments_on_users_id"

  create_table "orders", force: :cascade do |t|
    t.date    "order_made"
    t.integer "services_id"
    t.integer "users_id"
  end

  add_index "orders", ["services_id"], name: "index_orders_on_services_id"
  add_index "orders", ["users_id"], name: "index_orders_on_users_id"

  create_table "services", force: :cascade do |t|
    t.string   "name"
    t.integer  "socks_per_month"
    t.integer  "cost"
    t.datetime "created_at"
    t.date     "updated_at"
  end

  create_table "sizes", force: :cascade do |t|
    t.string "size_desc"
  end

  create_table "users", force: :cascade do |t|
    t.boolean  "account_type",    default: false
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.string   "password_digest"
    t.string   "address"
    t.string   "city"
    t.string   "postalcode"
    t.datetime "created_at"
    t.date     "deactivate"
    t.integer  "services_id"
    t.integer  "sizes_id"
  end

  add_index "users", ["services_id"], name: "index_users_on_services_id"
  add_index "users", ["sizes_id"], name: "index_users_on_sizes_id"

end
