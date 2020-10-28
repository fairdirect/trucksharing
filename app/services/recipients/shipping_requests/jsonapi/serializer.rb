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
                    :pickup_house, :pickup_street, :pickup_zip, :pallet_count

        link :public_url do |shipping_request|
          "/api/v1/recipients/shipping_requests/#{shipping_request.id}"
        end

        attribute :donation_date do |shipping_request|
          shipping_request.donation_date.to_date
        end

        attribute :delivery_deadline do |shipping_request|
          shipping_request.delivery_deadline.to_date
        end

        attribute :weight do |shipping_request|
          "#{shipping_request.cargo_weight} kg"
        end

        attribute :price do |shipping_request|
          price = shipping_request.shipment_price
          "#{sprintf("%.2f",(price.amount_dollars))} #{price.currency}"
        end
      end
    end
  end
end
