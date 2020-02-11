# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_02_07_183853) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "currencies", primary_key: "code", force: :cascade do |t|
    t.string "name"
    t.string "str_code"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "rates", force: :cascade do |t|
    t.string "category", null: false
    t.bigint "from_currency_id", null: false
    t.bigint "to_currency_id", null: false
    t.decimal "buy", precision: 15, scale: 8
    t.decimal "sell", precision: 15, scale: 8
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["from_currency_id"], name: "index_rates_on_from_currency_id"
    t.index ["to_currency_id"], name: "index_rates_on_to_currency_id"
  end

  add_foreign_key "rates", "currencies", column: "from_currency_id", primary_key: "code"
  add_foreign_key "rates", "currencies", column: "to_currency_id", primary_key: "code"
end
