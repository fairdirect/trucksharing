module Marketplace
  module ProductOrders
    class HalfPallet < Pallet
      UNIT_WEIGHT = 120
      PALLET_DIVISOR = 2

      def weight
        quantity * UNIT_WEIGHT
      end

      def pallet_count
        quantity / PALLET_DIVISOR
      end
    end
  end
end

