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

ActiveRecord::Schema.define(version: 2020_10_12_093656) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "epelia_addresses", id: :serial, force: :cascade do |t|
    t.text "gender"
    t.text "company"
    t.text "firstname"
    t.text "name"
    t.text "street"
    t.text "house"
    t.boolean "deleted", default: false, null: false
    t.integer "user_id"
    t.text "zip", null: false
    t.text "city", null: false
    t.text "country", default: "DE", null: false
  end

  create_table "epelia_bank_accounts", id: :serial, force: :cascade do |t|
    t.integer "user_id", null: false
    t.text "account_nr", null: false
    t.text "account_holder", null: false
    t.text "bank_id", null: false
    t.text "bank_name", null: false
  end

  create_table "epelia_countries", id: :text, force: :cascade do |t|
    t.text "name", null: false
    t.text "phone", null: false
  end

  create_table "epelia_emails", primary_key: "name", id: :text, force: :cascade do |t|
    t.text "subject", null: false
    t.text "content", null: false
    t.text "vars"
  end

  create_table "epelia_invoices", id: :serial, force: :cascade do |t|
    t.integer "shop_id", null: false
    t.decimal "invoice_amount", precision: 6, scale: 2, null: false
    t.text "file"
    t.integer "month", null: false
    t.integer "year", null: false
    t.decimal "payout", precision: 6, scale: 2, null: false
    t.date "last_sent"
    t.text "last_sent_email"
  end

  create_table "epelia_newsletters", id: :serial, force: :cascade do |t|
    t.text "content", null: false
    t.date "created", default: -> { "now()" }
    t.boolean "deleted", default: false
    t.text "subject", null: false
    t.text "type", default: "text", null: false
  end

  create_table "epelia_newsletters_log", id: :serial, force: :cascade do |t|
    t.integer "newsletter_id", null: false
    t.text "address", null: false
    t.boolean "success", default: false, null: false
    t.date "sent_date", default: -> { "now()" }
  end

  create_table "epelia_orders", id: :serial, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "shop_id", null: false
    t.integer "delivery_addr_id"
    t.integer "billing_addr_id"
    t.text "status", default: "in_process", null: false
    t.date "created", default: -> { "now()" }, null: false
    t.decimal "shipping", precision: 4, scale: 2, default: "0.0", null: false
    t.date "send_date"
    t.text "order_number", null: false
    t.index ["order_number"], name: "epelia_orders_order_number_key", unique: true
  end

  create_table "epelia_pictures", id: :serial, force: :cascade do |t|
    t.text "filename", null: false
    t.index ["filename"], name: "epelia_pictures_filename_key", unique: true
  end

  create_table "epelia_product_attributes", id: :serial, force: :cascade do |t|
    t.text "name", null: false
    t.text "type", null: false
  end

  create_table "epelia_product_categories", id: :serial, force: :cascade do |t|
    t.text "name", null: false
    t.integer "product_group_id"
    t.text "description"
  end

  create_table "epelia_product_groups", id: :serial, force: :cascade do |t|
    t.text "name", null: false
    t.text "type", null: false
    t.text "description"
  end

  create_table "epelia_product_price_content_types", id: :serial, force: :cascade do |t|
    t.text "name", null: false
    t.boolean "deleted", default: false
  end

  create_table "epelia_product_price_units", id: :serial, force: :cascade do |t|
    t.text "singular", null: false
    t.text "plural", null: false
  end

  create_table "epelia_product_prices", id: :serial, force: :cascade do |t|
    t.integer "product_id", null: false
    t.decimal "value", precision: 6, scale: 2, null: false
    t.integer "quantity", default: 1, null: false
    t.boolean "is_wholesale", default: false
    t.boolean "deleted", default: false
    t.integer "unit_type_id", null: false
    t.integer "content_type_id", null: false
    t.integer "contents", null: false
    t.boolean "active", default: true, null: false
  end

  create_table "epelia_product_ratings", id: :serial, force: :cascade do |t|
    t.integer "product_id", null: false
    t.integer "user_id"
    t.text "comment"
    t.decimal "rating", precision: 2, scale: 1, null: false
    t.text "status", default: "accepted"
    t.date "created", default: -> { "now()" }
  end

  create_table "epelia_products", id: :serial, force: :cascade do |t|
    t.integer "shop_id", null: false
    t.text "name", null: false
    t.text "description"
    t.integer "num_views", default: 0, null: false
    t.boolean "active", default: false, null: false
    t.integer "stock"
    t.date "created", default: -> { "now()" }, null: false
    t.boolean "deleted", default: false, null: false
    t.integer "category_id"
    t.text "ingredients"
    t.text "traces"
    t.boolean "is_bio", default: false
    t.boolean "is_discount", default: false
    t.text "tags"
    t.index ["name", "description", "ingredients", "tags"], name: "epelia_products_name_description_ingredients_tags_idx"
  end

  create_table "epelia_products_home_groups", id: :serial, force: :cascade do |t|
    t.text "name", null: false
  end

  create_table "epelia_products_home_groups_products", id: false, force: :cascade do |t|
    t.integer "group_id", null: false
    t.integer "product_id", null: false
  end

  create_table "epelia_products_orders", id: false, force: :cascade do |t|
    t.integer "product_id", null: false
    t.integer "order_id", null: false
    t.integer "quantity", default: 1, null: false
    t.decimal "value", precision: 6, scale: 2, null: false
    t.text "unit_type", null: false
    t.text "content_type", null: false
    t.integer "contents", null: false
    t.integer "price_quantity", default: 1, null: false
  end

  create_table "epelia_products_pictures", id: false, force: :cascade do |t|
    t.integer "product_id", null: false
    t.integer "picture_id", null: false
  end

  create_table "epelia_products_product_attributes", id: false, force: :cascade do |t|
    t.integer "product_id", null: false
    t.integer "product_attribute_id", null: false
  end

  create_table "epelia_products_shopping_carts", id: false, force: :cascade do |t|
    t.integer "product_id", null: false
    t.integer "shopping_cart_id", null: false
    t.integer "product_price_id", null: false
    t.integer "quantity", default: 1, null: false
    t.date "added", default: -> { "now()" }
  end

  create_table "epelia_shipping_costs", primary_key: ["shop_id", "country_id"], force: :cascade do |t|
    t.integer "shop_id", null: false
    t.text "country_id", null: false
    t.decimal "value", precision: 4, scale: 2, null: false
    t.decimal "free_from", precision: 6, scale: 2
  end

  create_table "epelia_shopping_carts", id: :serial, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "delivery_addr_id", null: false
    t.integer "billing_addr_id", null: false
    t.text "status", default: "running", null: false
    t.date "created", default: -> { "now()" }
    t.text "ip", null: false
    t.text "payment_type"
  end

  create_table "epelia_shops", id: :serial, force: :cascade do |t|
    t.integer "user_id", null: false
    t.text "name", null: false
    t.text "url", null: false
    t.integer "logo_id"
    t.decimal "provision", precision: 6, scale: 2, default: "4.0", null: false
    t.text "taxnumber"
    t.text "salestax_id"
    t.text "status", default: "new", null: false
    t.boolean "deleted", default: false, null: false
    t.text "company"
    t.text "street"
    t.text "house"
    t.text "zip"
    t.text "city"
    t.text "phone"
    t.text "fax"
    t.boolean "small_business", default: false
    t.text "register_id"
    t.text "register_court"
    t.text "office"
    t.text "representative"
    t.text "eco_control_board"
    t.text "eco_control_id"
    t.text "bank_account_holder"
    t.text "bank_account_number"
    t.text "bank_id"
    t.text "bank_name"
    t.text "bank_swift"
    t.text "bank_iban"
    t.text "description"
    t.text "history"
    t.integer "history_picture_id"
    t.text "philosophy"
    t.text "procedure"
    t.integer "procedure_picture_id"
    t.text "additional"
    t.text "company_type"
    t.date "created", default: -> { "now()" }, null: false
    t.text "country", default: "DE", null: false
    t.index ["salestax_id"], name: "epelia_shops_taxident_key", unique: true
    t.index ["url"], name: "epelia_shops_url_key", unique: true
  end

  create_table "epelia_shops_pictures", id: false, force: :cascade do |t|
    t.integer "shop_id", null: false
    t.integer "picture_id", null: false
  end

  create_table "epelia_users", id: :serial, force: :cascade do |t|
    t.integer "phpbb_id", null: false
    t.text "email", null: false
    t.text "password", null: false
    t.text "salt", null: false
    t.date "birthday"
    t.text "type", default: "customer", null: false
    t.boolean "is_admin", default: false, null: false
    t.boolean "is_wholesale", default: false, null: false
    t.integer "main_delivery_address_id"
    t.integer "main_billing_address_id"
    t.integer "last_delivery_address_id"
    t.integer "last_billing_address_id"
    t.text "status", default: "new", null: false
    t.date "registered", default: -> { "now()" }
    t.date "last_login", default: -> { "now()" }
    t.boolean "deleted", default: false, null: false
    t.text "username"
    t.boolean "newsletter", default: false
    t.text "old_password_hash"
    t.text "password_reset_token"
    t.index ["email"], name: "epelia_users_email_key", unique: true
    t.index ["username"], name: "epelia_users_username_key", unique: true
  end

  create_table "geodb_locations", id: :integer, default: nil, force: :cascade do |t|
    t.text "country", null: false
    t.text "plz", null: false
    t.text "name", null: false
    t.decimal "lat", null: false
    t.decimal "lon", null: false
    t.index ["lat"], name: "geodb_locations_lat_idx"
    t.index ["lon"], name: "geodb_locations_lon_idx"
    t.index ["plz", "country"], name: "geodb_locations_plz_country_idx"
  end

  add_foreign_key "epelia_addresses", "epelia_countries", column: "country", name: "epelia_addresses_country_fkey"
  add_foreign_key "epelia_addresses", "epelia_users", column: "user_id", name: "epelia_adresses_related_to_fkey"
  add_foreign_key "epelia_bank_accounts", "epelia_users", column: "user_id", name: "epelia_bank_accounts_user_id_fkey", on_delete: :cascade
  add_foreign_key "epelia_invoices", "epelia_shops", column: "shop_id", name: "epelia_invoices_shop_id_fkey", on_delete: :nullify
  add_foreign_key "epelia_newsletters_log", "epelia_newsletters", column: "newsletter_id", name: "epelia_newsletters_log_newsletter_id_fkey"
  add_foreign_key "epelia_orders", "epelia_addresses", column: "billing_addr_id", name: "epelia_orders_billing_addr_fkey", on_delete: :nullify
  add_foreign_key "epelia_orders", "epelia_addresses", column: "delivery_addr_id", name: "epelia_orders_delivery_addr_fkey", on_delete: :nullify
  add_foreign_key "epelia_orders", "epelia_shops", column: "shop_id", name: "epelia_orders_shop_id_fkey"
  add_foreign_key "epelia_orders", "epelia_users", column: "user_id", name: "epelia_orders_user_id_fkey"
  add_foreign_key "epelia_product_categories", "epelia_product_groups", column: "product_group_id", name: "epelia_product_categories_product_group_id_fkey", on_update: :nullify
  add_foreign_key "epelia_product_prices", "epelia_product_price_content_types", column: "content_type_id", name: "epelia_product_prices_content_type_fkey", on_delete: :cascade
  add_foreign_key "epelia_product_prices", "epelia_product_price_units", column: "unit_type_id", name: "epelia_product_prices_unit_type_fkey", on_delete: :cascade
  add_foreign_key "epelia_product_prices", "epelia_products", column: "product_id", name: "epelia_product_prices_product_id_fkey"
  add_foreign_key "epelia_product_ratings", "epelia_products", column: "product_id", name: "epelia_product_ratings_product_id_fkey", on_delete: :cascade
  add_foreign_key "epelia_product_ratings", "epelia_users", column: "user_id", name: "epelia_product_ratings_user_id_fkey", on_delete: :nullify
  add_foreign_key "epelia_products", "epelia_product_categories", column: "category_id", name: "epelia_products_category_id_fkey", on_delete: :nullify
  add_foreign_key "epelia_products_home_groups_products", "epelia_products", column: "product_id", name: "epelia_products_home_groups_products_product_id_fkey", on_delete: :cascade
  add_foreign_key "epelia_products_home_groups_products", "epelia_products_home_groups", column: "group_id", name: "epelia_products_home_groups_products_group_id_fkey", on_delete: :cascade
  add_foreign_key "epelia_products_orders", "epelia_orders", column: "order_id", name: "epelia_products_orders_order_id_fkey", on_delete: :cascade
  add_foreign_key "epelia_products_orders", "epelia_products", column: "product_id", name: "epelia_products_orders_product_id_fkey"
  add_foreign_key "epelia_products_pictures", "epelia_pictures", column: "picture_id", name: "epelia_products_pictures_picture_id_fkey", on_delete: :cascade
  add_foreign_key "epelia_products_pictures", "epelia_products", column: "product_id", name: "epelia_products_pictures_product_id_fkey", on_delete: :cascade
  add_foreign_key "epelia_products_product_attributes", "epelia_product_attributes", column: "product_attribute_id", name: "epelia_products_product_attributes_product_attribute_id_fkey"
  add_foreign_key "epelia_products_product_attributes", "epelia_products", column: "product_id", name: "epelia_products_product_attributes_product_id_fkey"
  add_foreign_key "epelia_products_shopping_carts", "epelia_product_prices", column: "product_price_id", name: "epelia_product_shopping_cart_product_price_id_fkey"
  add_foreign_key "epelia_products_shopping_carts", "epelia_products", column: "product_id", name: "epelia_product_shopping_cart_product_id_fkey"
  add_foreign_key "epelia_products_shopping_carts", "epelia_shopping_carts", column: "shopping_cart_id", name: "epelia_product_shopping_cart_shopping_cart_id_fkey", on_delete: :cascade
  add_foreign_key "epelia_shipping_costs", "epelia_countries", column: "country_id", name: "epelia_shipping_costs_country_id_fkey"
  add_foreign_key "epelia_shipping_costs", "epelia_shops", column: "shop_id", name: "epelia_shipping_costs_shop_id_fkey", on_delete: :cascade
  add_foreign_key "epelia_shopping_carts", "epelia_addresses", column: "billing_addr_id", name: "epelia_shopping_carts_billing_addr_fkey"
  add_foreign_key "epelia_shopping_carts", "epelia_addresses", column: "delivery_addr_id", name: "epelia_shopping_carts_delivery_addr_fkey"
  add_foreign_key "epelia_shopping_carts", "epelia_users", column: "user_id", name: "epelia_shopping_carts_user_id_fkey"
  add_foreign_key "epelia_shops", "epelia_countries", column: "country", name: "epelia_shops_country_fkey"
  add_foreign_key "epelia_shops", "epelia_pictures", column: "history_picture_id", name: "epelia_shops_history_picture_fkey", on_delete: :nullify
  add_foreign_key "epelia_shops", "epelia_pictures", column: "logo_id", name: "epelia_shops_logo_id_fkey", on_delete: :nullify
  add_foreign_key "epelia_shops", "epelia_pictures", column: "procedure_picture_id", name: "epelia_shops_procedure_picture_fkey", on_delete: :nullify
  add_foreign_key "epelia_shops", "epelia_users", column: "user_id", name: "epelia_shops_user_id_fkey"
  add_foreign_key "epelia_shops_pictures", "epelia_pictures", column: "picture_id", name: "epelia_shops_pictures_picture_id_fkey", on_delete: :cascade
  add_foreign_key "epelia_shops_pictures", "epelia_shops", column: "shop_id", name: "epelia_shops_pictures_shop_id_fkey", on_delete: :cascade
  add_foreign_key "epelia_users", "epelia_addresses", column: "last_billing_address_id", name: "epelia_users_last_billing_adress_fkey"
  add_foreign_key "epelia_users", "epelia_addresses", column: "last_delivery_address_id", name: "epelia_users_last_delivery_adress_fkey"
  add_foreign_key "epelia_users", "epelia_addresses", column: "main_billing_address_id", name: "epelia_users_main_billing_adress_fkey"
  add_foreign_key "epelia_users", "epelia_addresses", column: "main_delivery_address_id", name: "epelia_users_main_delivery_adress_fkey"
end
