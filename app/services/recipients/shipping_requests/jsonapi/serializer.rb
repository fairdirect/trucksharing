module Recipients
  module ShippingRequests
    module Jsonapi
      class Serializer < ::AbstractJsonapiSerializer

        set_type    :shipping_request
        set_id      :id
        attributes  :order_number, :status

        link :public_url do |shipping_request|
          "/api/v1/recipients/shipping_requests/#{shipping_request.id}"
        end

        belongs_to  :delivery_addr, serializer: DeliveryAddressSerializer
        belongs_to  :shop, serializer: ShopSerializer

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
