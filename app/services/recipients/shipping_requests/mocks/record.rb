module Recipients
  module ShippingRequests
    module Mocks
      Record = Struct.new(
        :id, :user_id, :status, :created, :shipping, :send_date, :order_number,
        :shop, :delivery_addr, :billing_addr, :products
      ) do

        def weight
          products.sum(&:weight)
        end
      end
    end
  end
end
