# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_10_12_142211) do
  create_table "banks", charset: "utf8mb4", force: :cascade do |t|
    t.string "name", null: false
    t.integer "amount_price", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_banks_on_user_id"
  end

  create_table "settlements", charset: "utf8mb4", force: :cascade do |t|
    t.string "payment", null: false
    t.bigint "user_id", null: false
    t.bigint "bank_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bank_id"], name: "index_settlements_on_bank_id"
    t.index ["user_id"], name: "index_settlements_on_user_id"
  end

  create_table "spendings", charset: "utf8mb4", force: :cascade do |t|
    t.integer "price", null: false
    t.string "item_name", null: false
    t.integer "category_id", null: false
    t.date "start_time", null: false
    t.bigint "user_id", null: false
    t.bigint "settlement_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["settlement_id"], name: "index_spendings_on_settlement_id"
    t.index ["user_id"], name: "index_spendings_on_user_id"
  end

  create_table "users", charset: "utf8mb4", force: :cascade do |t|
    t.string "nickname", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "banks", "users"
  add_foreign_key "settlements", "banks"
  add_foreign_key "settlements", "users"
  add_foreign_key "spendings", "settlements"
  add_foreign_key "spendings", "users"
end
