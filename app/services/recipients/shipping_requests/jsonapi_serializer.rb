module Recipients
  module ShippingRequests
    class JsonapiSerializer < ::AbstractJsonapiSerializer

      set_type    :shipping_request
      set_id      :id
      attributes  :id, :order_number, :status

      attribute   :donation_date do |sh_req|
        sh_req.created
      end

      attribute   :weight do |sh_req|
        "#{sh_req.weight} kg"
      end
    end
  end
end
