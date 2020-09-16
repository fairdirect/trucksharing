require "securerandom"
require "date"

require_relative "record"
require_relative "product"
require_relative "address"
require_relative "shop"

module Recipients
  module ShippingRequests
    module Mocks
      class Generator
        def generate_record(id:, user_id:, created_at: DateTime.new(2020,9,8,12,0,5), order_number: SecureRandom.hex(12))
          Mocks::Record.new(
            id,
            user_id,
            :status,
            created_at,
            :shipping,
            :send_date,
            order_number,
            generate_shop,
            generate_delivery_addr,
            generate_billing_addr,
            generate_products
          )
        end

        def generate_products
          [
            Mocks::Product.new(
              1,
              15,
              "pallet",
              "solid",
              :contents,
              "Canned salmon"
            ),
            Mocks::Product.new(
              2,
              5,
              "pallet",
              "liquid",
              :contents,
              "Bottled Water"
            )
          ]
        end

        def generate_delivery_addr
          Mocks::Address.new(
            :gender, "Awesome Foundation",
            "Lucas", "Blau", "Notreal Str", "1", "7000", "Leipzig", "DE"
          )
        end

        def generate_billing_addr
          generate_delivery_addr
        end

        def generate_shop
          Mocks::Shop.new(
            1, "Incredible Shop - Berlin", SecureRandom.hex(12), SecureRandom.hex(12),
            "Incredible Shop Inc.", "Fake Street", "12", "10115", "Berlin", "+49 699-999-999", nil,
            :register_id, :register_court, :office, :representative,
            :eco_control_board, :eco_control_id, "DE"
          )
        end
      end
    end
  end
end
