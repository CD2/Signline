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

ActiveRecord::Schema.define(version: 20160403222837) do

  create_table "addresses", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "addresses", ["user_id"], name: "index_addresses_on_user_id"

  create_table "brands", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.string   "url_alias"
    t.integer  "parent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categorisations", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "categorisations", ["category_id"], name: "index_categorisations_on_category_id"
  add_index "categorisations", ["product_id"], name: "index_categorisations_on_product_id"

  create_table "menu_items", force: :cascade do |t|
    t.integer  "site_id"
    t.integer  "page_id"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_items", force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "product_id"
    t.integer  "quantity",                                default: 1
    t.decimal  "unit_price",      precision: 8, scale: 2
    t.decimal  "unit_cost_price", precision: 8, scale: 2
    t.decimal  "tax_rate",        precision: 8, scale: 4
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
  end

  add_index "order_items", ["order_id"], name: "index_order_items_on_order_id"
  add_index "order_items", ["product_id"], name: "index_order_items_on_product_id"

  create_table "orders", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "orders", ["user_id"], name: "index_orders_on_user_id"

  create_table "pages", force: :cascade do |t|
    t.string   "name"
    t.string   "banner"
    t.string   "banner_text"
    t.text     "body"
    t.string   "layout"
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

  add_index "product_images", ["product_id"], name: "index_product_images_on_product_id"

  create_table "products", force: :cascade do |t|
    t.integer  "brand_id"
    t.string   "name"
    t.string   "sku"
    t.text     "body"
    t.text     "features"
    t.string   "mpn"
    t.decimal  "unit_price",      precision: 8, scale: 2
    t.decimal  "unit_cost_price", precision: 8, scale: 2
    t.decimal  "tax_rate",        precision: 8, scale: 4
    t.integer  "status"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  add_index "products", ["brand_id"], name: "index_products_on_brand_id"

  create_table "site_brands", force: :cascade do |t|
    t.integer  "site_id"
    t.integer  "brand_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "site_brands", ["brand_id"], name: "index_site_brands_on_brand_id"
  add_index "site_brands", ["site_id"], name: "index_site_brands_on_site_id"

  create_table "site_categories", force: :cascade do |t|
    t.integer  "site_id"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "site_categories", ["category_id"], name: "index_site_categories_on_category_id"
  add_index "site_categories", ["site_id"], name: "index_site_categories_on_site_id"

  create_table "site_pages", force: :cascade do |t|
    t.integer  "site_id"
    t.integer  "page_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sites", force: :cascade do |t|
    t.string   "name"
    t.string   "subdomain"
    t.string   "logo"
    t.string   "color"
    t.boolean  "active",     default: true
    t.boolean  "default",    default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
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
