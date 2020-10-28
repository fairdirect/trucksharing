module Marketplace
  module ProductOrders
    class Pallet
      UNIT_WEIGHT = 300
      PALLET_DIVISOR = 1

      def initialize(quantity)
        @unit_type = unit_type
        @quantity = quantity
      end

      def weight
        quantity * UNIT_WEIGHT
      end

      def pallet_count
        quantity / PALLET_DIVISOR
      end

      private

      attr_reader :unit_type, :quantity
    end
  end
end

