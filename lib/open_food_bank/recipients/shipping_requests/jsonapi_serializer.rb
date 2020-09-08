require "open_food_bank/abstract_jsonapi_serializer"

module OpenFoodBank
  module Recipients
    module ShippingRequests
      class JsonapiSerializer < OpenFoodBank::AbstractJsonapiSerializer

        set_type    :shipping_request
        set_id      :id
        attributes  :id, :order_number, :status, :donation_date

        attribute   :cargo_type do |sh_req|
          "#{sh_req.cargo.type}"
        end

        attribute   :cargo_volume do |sh_req|
          "#{sh_req.cargo.volume}"
        end

        attribute   :weight do |sh_req|
          weight = sh_req.weight
          "#{weight.value} #{weight.unit}"
        end
      end
    end
  end
end
