class AddWeightAndPalletAmountToShippingRequests < ActiveRecord::Migration[6.0]
  def change
    add_column :logistics_shipping_requests, :cargo_weight, :integer, default: 0, null: false
    add_column :logistics_shipping_requests, :pallet_count, :integer, default: 0, null: false
  end
end
