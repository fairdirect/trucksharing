module Recipients
  module ShippingRequests
    module Jsonapi
      class Serializer < ::AbstractJsonapiSerializer

        set_type    :shipping_request
        set_id      :id
        attributes  :order_number, :status

        has_one     :delivery_addr, serializer: DeliveryAddressSerializer

        attribute   :donation_date do |sh_req|
          sh_req.created
        end

        attribute   :weight do |sh_req|
          "#{sh_req.weight} kg"
        end
      end
    end
  end
end
