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

ActiveRecord::Schema.define(version: 2021_06_22_132508) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "deliveries", force: :cascade do |t|
    t.datetime "date"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_deliveries_on_user_id"
  end

  create_table "delivery_products", force: :cascade do |t|
    t.string "quantity_of_wine"
    t.bigint "delivery_id", null: false
    t.bigint "wine_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["delivery_id"], name: "index_delivery_products_on_delivery_id"
    t.index ["wine_id"], name: "index_delivery_products_on_wine_id"
  end

  create_table "designations", force: :cascade do |t|
    t.text "description"
    t.string "region"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "order_wines", force: :cascade do |t|
    t.integer "quantity_of_wine"
    t.bigint "order_id", null: false
    t.bigint "wine_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["order_id"], name: "index_order_wines_on_order_id"
    t.index ["wine_id"], name: "index_order_wines_on_wine_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "total_price"
    t.string "status"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.text "comment"
    t.integer "rating"
    t.bigint "wine_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_reviews_on_user_id"
    t.index ["wine_id"], name: "index_reviews_on_wine_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "wineboxes", force: :cascade do |t|
    t.bigint "wine_id", null: false
    t.integer "quantity_of_wine"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_wineboxes_on_user_id"
    t.index ["wine_id"], name: "index_wineboxes_on_wine_id"
  end

  create_table "wines", force: :cascade do |t|
    t.string "name"
    t.string "grape_variety"
    t.string "vineyard"
    t.text "description"
    t.string "category"
    t.integer "price"
    t.string "photo"
    t.string "country"
    t.integer "year"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "designation_id", null: false
    t.index ["designation_id"], name: "index_wines_on_designation_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "deliveries", "users"
  add_foreign_key "delivery_products", "deliveries"
  add_foreign_key "delivery_products", "wines"
  add_foreign_key "order_wines", "orders"
  add_foreign_key "order_wines", "wines"
  add_foreign_key "orders", "users"
  add_foreign_key "reviews", "users"
  add_foreign_key "reviews", "wines"
  add_foreign_key "wineboxes", "users"
  add_foreign_key "wineboxes", "wines"
  add_foreign_key "wines", "designations"
end
