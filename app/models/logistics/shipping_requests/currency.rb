module Logistics
  module ShippingRequests
    class Currency
      def initialize(short_name: "EUR", has_cents: true)
        @short_name = short_name
        @has_cents = has_cents
      end

      def cents_to_dollars(amount)
        return amount.to_f unless has_cents
        amount.to_f / 100
      end

      def to_s
        short_name
      end

      private

      attr_reader :short_name, :has_cents
    end
  end
end

