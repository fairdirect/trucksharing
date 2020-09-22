module Recipients
  module ShippingRequests
    module Jsonapi
      class DeliveryAddressSerializer < ::AbstractJsonapiSerializer
        set_type    :delivery_address
        set_id      :id
        attributes  :gender, :company, :firstname, :name, :street, :house, :zip, :city, :country
      end
    end
  end
end
