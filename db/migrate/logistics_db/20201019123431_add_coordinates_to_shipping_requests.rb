class AddCoordinatesToShippingRequests < ActiveRecord::Migration[6.0]
  def change
    add_column :logistics_shipping_requests, :delivery_lat, :string, null: false, default: "-1"
    add_column :logistics_shipping_requests, :delivery_lng, :string, null: false, default: "-1"
    add_column :logistics_shipping_requests, :pickup_lat, :string, null: false, default: "-1"
    add_column :logistics_shipping_requests, :pickup_lng, :string, null: false, default: "-1"
    add_column :logistics_shipping_requests, :route_length_meters, :integer, null: false, default: -1
  end
end
