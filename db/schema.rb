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

ActiveRecord::Schema.define(version: 20160627145815) do

  create_table "addresses", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "address_one"
    t.string   "address_two"
    t.string   "city"
    t.string   "county"
    t.string   "postcode"
    t.string   "country",     default: "UK"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "brands", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.string   "url_alias"
    t.integer  "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "categories", ["parent_id"], name: "index_categories_on_parent_id"

  create_table "categorisations", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable"
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type"

  create_table "delivery_services", force: :cascade do |t|
    t.string   "name"
    t.string   "code"
    t.decimal  "price",        precision: 8, scale: 2
    t.decimal  "cost_price",   precision: 8, scale: 2
    t.boolean  "default"
    t.boolean  "active"
    t.string   "courier"
    t.string   "tracking_url"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  create_table "enquiries", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_items", force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "product_id"
    t.integer  "quantity",                                default: 1
    t.string   "name"
    t.decimal  "unit_price",      precision: 8, scale: 2
    t.decimal  "unit_cost_price", precision: 8, scale: 2
    t.decimal  "tax_rate",        precision: 8, scale: 4
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "shipping_address_id"
    t.integer  "billing_address_id"
    t.integer  "checkout_status",                               default: 0
    t.integer  "order_status"
    t.integer  "payment_type"
    t.integer  "shipping_type"
    t.boolean  "same_shipping_address"
    t.integer  "delivery_service_id"
    t.decimal  "delivery_price",        precision: 8, scale: 2
    t.decimal  "delivery_cost_price",   precision: 8, scale: 2
    t.decimal  "delivery_tax_rate",     precision: 8, scale: 2
    t.decimal  "delivery_tax_amount",   precision: 8, scale: 2
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.string   "ip"
    t.string   "express_token"
    t.string   "express_payer_id"
    t.decimal  "amount",                precision: 8, scale: 2
    t.string   "payment_method"
    t.string   "order_tracking_id"
    t.integer  "flag"
    t.datetime "purchased_at"
    t.datetime "shipped_at"
    t.datetime "created_at",                                                null: false
    t.datetime "updated_at",                                                null: false
  end

  create_table "pages", force: :cascade do |t|
    t.string   "name"
    t.string   "banner"
    t.string   "banner_text"
    t.text     "body"
    t.string   "layout"
    t.string   "menu_item_name"
    t.boolean  "side"
    t.integer  "site_id"
    t.string   "page_title"
    t.string   "url_alias"
    t.text     "meta_description"
    t.boolean  "published"
    t.boolean  "global"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "product_images", force: :cascade do |t|
    t.integer  "product_id"
    t.string   "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.integer  "brand_id"
    t.string   "name"
    t.string   "machine_name"
    t.string   "sku"
    t.text     "body"
    t.text     "features"
    t.string   "mpn"
    t.decimal  "unit_price",      precision: 8, scale: 2
    t.decimal  "unit_cost_price", precision: 8, scale: 2
    t.decimal  "tax_rate",        precision: 8, scale: 4
    t.decimal  "delivery",        precision: 8, scale: 2
    t.integer  "status"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  create_table "site_brands", force: :cascade do |t|
    t.integer  "site_id"
    t.integer  "brand_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "site_categories", force: :cascade do |t|
    t.integer  "site_id"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "sites", force: :cascade do |t|
    t.string   "name"
    t.string   "subdomain"
    t.string   "logo"
    t.string   "color"
    t.boolean  "active",      default: true
    t.boolean  "default",     default: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "category_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.string   "password_digest"
    t.boolean  "admin",             default: false
    t.string   "remember_digest"
    t.string   "activation_digest"
    t.boolean  "activated",         default: false
    t.datetime "activated_at"
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

end
