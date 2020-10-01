module Recipients
  module ShippingRequests
    module Jsonapi
      class Serializer < ::AbstractJsonapiSerializer

        set_type    :shipping_request
        set_id      :id
        attributes  :order_number, :status,
                    :delivery_city, :delivery_company_name, :delivery_country,
                    :delivery_house, :delivery_street, :delivery_zip,
                    :pickup_city, :pickup_company_name, :pickup_country,
                    :pickup_house, :pickup_street, :pickup_zip

        link :public_url do |shipping_request|
          "/api/v1/recipients/shipping_requests/#{shipping_request.id}"
        end

        attribute :donation_date do |sh_req|
          sh_req.donation_date.to_date
        end

        attribute :delivery_deadline do |sh_req|
          sh_req.delivery_deadline.to_date
        end

        attribute   :weight do |sh_req|
          "#{sh_req.weight} kg"
        end
      end
    end
  end
end
