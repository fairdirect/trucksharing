module Logistics
  module ShippingRequests
    class ShipmentPrice
      attr_reader :liters, :cents_per_liter, :currency

      def initialize(liters, cents_per_liter: 500, currency: ShippingRequests::Currency.new)
        @cents_per_liter = cents_per_liter
        @liters = liters
        @currency = currency
      end

      def amount_dollars
        currency.cents_to_dollars(amount_cents)
      end

      def amount_cents
        liters * cents_per_liter
      end
    end
  end
end

