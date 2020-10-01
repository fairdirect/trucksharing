class CreateShippingRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :logistics_shipping_requests do |t|
      t.references :user

      t.string     :order_number, null: false
      t.datetime   :donation_date, null: false
      t.datetime   :delivery_deadline, null: false

      # Delivery Address
      t.string     :delivery_city, null: false
      t.string     :delivery_company_name, null: false
      t.string     :delivery_country, null: false
      t.string     :delivery_firstname, null: false
      t.string     :delivery_house, null: false
      t.string     :delivery_name, null: false
      t.string     :delivery_street, null: false
      t.string     :delivery_zip, null: false

      # Pickup Address
      t.string     :pickup_city, null: false
      t.string     :pickup_company_name, null: false
      t.string     :pickup_country, null: false
      t.string     :pickup_firstname, null: false
      t.string     :pickup_house, null: false
      t.string     :pickup_name, null: false
      t.string     :pickup_street, null: false
      t.string     :pickup_zip, null: false
      t.timestamps
    end
  end
end
