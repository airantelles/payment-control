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

ActiveRecord::Schema.define(version: 2023_10_19_034608) do

  create_table "customers", force: :cascade do |t|
    t.string "name", limit: 40, null: false
    t.integer "day", null: false
    t.integer "invoice_type_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "invoice_types", force: :cascade do |t|
    t.string "name", limit: 40, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "invoices", force: :cascade do |t|
    t.integer "customer_id", null: false
    t.date "event_date", null: false
    t.text "logs"
    t.boolean "success", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "invoice_type_id", null: false
  end

  add_foreign_key "customers", "invoice_types"
  add_foreign_key "invoices", "customers"
  add_foreign_key "invoices", "invoice_types"
end
