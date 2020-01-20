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

ActiveRecord::Schema.define(version: 2019_12_28_012821) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "hstore"
  enable_extension "plpgsql"
  enable_extension "postgis"

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

  create_table "affiliate_plans", force: :cascade do |t|
    t.string "stripe_code"
    t.string "nickname"
    t.decimal "radius_miles"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "affiliates", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "business_name", null: false
    t.string "website"
    t.hstore "contact_name"
    t.string "phone"
    t.hstore "address"
    t.bigint "affiliate_plans_id"
    t.boolean "contract_signed"
    t.datetime "contract_signed_date"
    t.text "contract"
    t.bigint "terms_and_conditions_id"
    t.index ["affiliate_plans_id"], name: "index_affiliates_on_affiliate_plans_id"
    t.index ["email"], name: "index_affiliates_on_email", unique: true
    t.index ["reset_password_token"], name: "index_affiliates_on_reset_password_token", unique: true
    t.index ["terms_and_conditions_id"], name: "index_affiliates_on_terms_and_conditions_id"
  end

  create_table "carts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "line_items", force: :cascade do |t|
    t.bigint "registry_service_id"
    t.bigint "cart_id"
    t.integer "quantity", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cart_id"], name: "index_line_items_on_cart_id"
    t.index ["registry_service_id"], name: "index_line_items_on_registry_service_id"
  end

  create_table "registries", force: :cascade do |t|
    t.string "name"
    t.hstore "address"
    t.date "due_date"
    t.integer "num_child"
    t.integer "gender"
    t.datetime "shower_date"
    t.integer "shower_or_sprinkle"
    t.boolean "cards_ordered", default: false
    t.boolean "cards_sent", default: false
    t.boolean "accepts_check"
    t.boolean "accepts_wepay"
    t.bigint "user_id"
    t.string "slug", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_registries_on_user_id"
  end

  create_table "registry_services", force: :cascade do |t|
    t.bigint "service_id"
    t.bigint "registry_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["registry_id"], name: "index_registry_services_on_registry_id"
    t.index ["service_id"], name: "index_registry_services_on_service_id"
  end

  create_table "registry_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "service_categories", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "service_increments", force: :cascade do |t|
    t.bigint "registry_service_id"
    t.decimal "price"
    t.boolean "purchased", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["registry_service_id"], name: "index_service_increments_on_registry_service_id"
  end

  create_table "services", force: :cascade do |t|
    t.string "name"
    t.string "subtitle"
    t.text "description"
    t.decimal "price"
    t.integer "intervals"
    t.bigint "service_category_id"
    t.bigint "affiliate_id"
    t.geography "lonlat", limit: {:srid=>4326, :type=>"st_point", :geographic=>true}
    t.decimal "radius"
    t.boolean "approved", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["affiliate_id"], name: "index_services_on_affiliate_id"
    t.index ["lonlat"], name: "index_services_on_lonlat", using: :gist
    t.index ["service_category_id"], name: "index_services_on_service_category_id"
  end

  create_table "terms_and_conditions", force: :cascade do |t|
    t.text "text"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "phone_number"
    t.string "first_name"
    t.string "last_name"
    t.string "wepay_access_token"
    t.integer "wepay_account_id"
    t.boolean "admin", default: false
    t.integer "current_registry_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "affiliates", "terms_and_conditions", column: "terms_and_conditions_id"
  add_foreign_key "registry_services", "registries"
  add_foreign_key "registry_services", "services"
  add_foreign_key "service_increments", "registry_services"
end
