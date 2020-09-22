module Recipients
  module ShippingRequests
    module Mocks
      class Record
        def initialize(
          id, delivery_addr_id, shop_id, user_id, status, created, shipping, send_date, order_number,
          shop, delivery_addr, billing_addr, products
        )
          @id = id
          @delivery_addr_id = delivery_addr_id
          @shop_id = shop_id
          @user_id = user_id
          @status = status
          @created = created
          @shipping = shipping
          @send_date = send_date
          @order_number = order_number
          @shop = shop
          @delivery_addr = delivery_addr
          @billing_addr = billing_addr
          @products = products
        end

        attr_reader :id, :delivery_addr_id, :shop_id, :user_id,
                    :status, :created, :shipping, :send_date, :order_number,
                    :shop, :delivery_addr, :billing_addr, :products

        def weight
          products.sum(&:weight)
        end
      end
    end
  end
end
