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

ActiveRecord::Schema.define(version: 2021_05_29_205525) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.boolean "is_active"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "invoices", force: :cascade do |t|
    t.boolean "online_order"
    t.bigint "user_id"
    t.boolean "delivered"
    t.bigint "total_bill"
    t.bigint "production_cost"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "in_cart"
  end

  create_table "menu_items", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "category_id"
    t.bigint "price"
    t.bigint "ordering_frequency"
    t.bigint "production_cost"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "stock"
  end

  create_table "order_items", force: :cascade do |t|
    t.bigint "invoice_id"
    t.bigint "menu_item_id"
    t.bigint "menu_item_price"
    t.bigint "menu_item_production_cost"
    t.bigint "items_purchased"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "menu_item_name"
  end

  create_table "users", force: :cascade do |t|
    t.string "role"
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "address"
    t.bigint "phone"
  end

end
