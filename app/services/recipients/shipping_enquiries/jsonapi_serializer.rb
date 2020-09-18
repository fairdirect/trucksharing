module Recipients
  module ShippingEnquiries
    class JsonapiSerializer < ::AbstractJsonapiSerializer

      set_type    :shipping_enquiries
      set_id      :id
    end
  end
end
