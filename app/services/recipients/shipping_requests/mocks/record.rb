module Recipients
  module ShippingRequests
    module Mocks
      Record = Struct.new(
        :id, :user_id, :status, :created, :shipping, :send_date, :order_number,
        :shop, :delivery_addr, :billing_addr, :products
      ) do

        def delivery_addr_id
          delivery_addr.id
        end

        def weight
          products.sum(&:weight)
        end
      end
    end
  end
end
