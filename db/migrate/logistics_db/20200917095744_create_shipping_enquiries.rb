class CreateShippingEnquiries < ActiveRecord::Migration[5.2]
  def change
    create_table :logistics_shipping_enquiries do |t|
      t.references :service_provider
      t.references :shipping_request
      t.timestamps
    end
  end
end
