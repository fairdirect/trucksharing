module Recipients
  module ShippingRequests
    class JsonapiSerializer < ::AbstractJsonapiSerializer

      set_type    :shipping_request
      set_id      :id
      attributes  :id, :order_number, :status, :donation_date, :cargo_type

      attribute   :cargo_volume do |sh_req|
        "#{sh_req.cargo_quantity} #{sh_req.cargo_unit}#{sh_req.cargo_quantity > 1 ? 's' : ''}"
      end

      attribute   :weight do |sh_req|
        "#{sh_req.cargo_weight} #{sh_req.cargo_weight_unit}"
      end
    end
  end
end
