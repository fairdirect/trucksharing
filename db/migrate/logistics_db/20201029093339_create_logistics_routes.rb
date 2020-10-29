class CreateLogisticsRoutes < ActiveRecord::Migration[6.0]
  def change
    create_table :logistics_routes do |t|
      t.references :user

      t.datetime   :departing_at, null: false

      t.string     :departure_city, null: false
      t.string     :departure_country, null: false
      t.string     :departure_house, null: false
      t.string     :departure_street, null: false
      t.string     :departure_zip, null: false
      t.string     :departure_lat, null: false, default: "-1"
      t.string     :departure_lng, null: false, default: "-1"

      t.string     :destination_city, null: false
      t.string     :destination_country, null: false
      t.string     :destination_house, null: false
      t.string     :destination_street, null: false
      t.string     :destination_zip, null: false
      t.string     :destination_lat, null: false, default: "-1"
      t.string     :destination_lng, null: false, default: "-1"

      t.timestamps
    end
  end
end
