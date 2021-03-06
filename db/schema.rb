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

ActiveRecord::Schema.define(version: 20180914103819) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "tax_details", force: :cascade do |t|
    t.integer "total_amount"
    t.float "total_tax_amount"
    t.float "grand_total"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_tax_details_on_user_id"
  end

  create_table "taxes", force: :cascade do |t|
    t.string "name", limit: 150
    t.integer "tax_code"
    t.integer "amount"
    t.float "tax_amount"
    t.float "total_amount"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_taxes_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", limit: 150
    t.string "email", limit: 50
    t.string "hp", limit: 20
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "tax_details", "users"
  add_foreign_key "taxes", "users"
end
