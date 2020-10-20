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

ActiveRecord::Schema.define(version: 2020_10_19_123431) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "logistics_shipping_enquiries", force: :cascade do |t|
    t.bigint "service_provider_id"
    t.bigint "shipping_request_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["service_provider_id"], name: "index_logistics_shipping_enquiries_on_service_provider_id"
    t.index ["shipping_request_id"], name: "index_logistics_shipping_enquiries_on_shipping_request_id"
  end

  create_table "logistics_shipping_requests", force: :cascade do |t|
    t.bigint "user_id"
    t.string "order_number", null: false
    t.datetime "donation_date", null: false
    t.datetime "delivery_deadline", null: false
    t.string "delivery_city", null: false
    t.string "delivery_company_name", null: false
    t.string "delivery_country", null: false
    t.string "delivery_firstname", null: false
    t.string "delivery_house", null: false
    t.string "delivery_name", null: false
    t.string "delivery_street", null: false
    t.string "delivery_zip", null: false
    t.string "pickup_city", null: false
    t.string "pickup_company_name", null: false
    t.string "pickup_country", null: false
    t.string "pickup_firstname", null: false
    t.string "pickup_house", null: false
    t.string "pickup_name", null: false
    t.string "pickup_street", null: false
    t.string "pickup_zip", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "delivery_lat", default: "-1", null: false
    t.string "delivery_lng", default: "-1", null: false
    t.string "pickup_lat", default: "-1", null: false
    t.string "pickup_lng", default: "-1", null: false
    t.integer "route_length_meters", default: -1, null: false
    t.index ["user_id"], name: "index_logistics_shipping_requests_on_user_id"
  end

end
