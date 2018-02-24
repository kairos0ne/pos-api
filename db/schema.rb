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

ActiveRecord::Schema.define(version: 20180224152541) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "icon_path"
    t.string   "photo_path"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "ingredients", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "inventory_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["inventory_id"], name: "index_ingredients_on_inventory_id", using: :btree
  end

  create_table "inventories", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.decimal  "base_price",   precision: 5, scale: 2
    t.decimal  "retail_price", precision: 5, scale: 2
    t.integer  "category_id"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.index ["category_id"], name: "index_inventories_on_category_id", using: :btree
  end

  create_table "items", force: :cascade do |t|
    t.integer  "order_id"
    t.string   "name"
    t.text     "description"
    t.decimal  "price",       precision: 5, scale: 2
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["order_id"], name: "index_items_on_order_id", using: :btree
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "table_id"
    t.decimal  "total",      precision: 5, scale: 2
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.index ["table_id"], name: "index_orders_on_table_id", using: :btree
  end

  create_table "tables", force: :cascade do |t|
    t.integer  "capacity"
    t.integer  "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "token"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.datetime "token_created_at"
  end

  add_foreign_key "ingredients", "inventories"
  add_foreign_key "inventories", "categories"
  add_foreign_key "items", "orders"
  add_foreign_key "orders", "tables"
end
