module Marketplace
  module ProductOrders
    class PackagePallet
      UNIT_WEIGHT = 20
      PALLET_DIVISOR = 20

      def initialize(packages_quantity)
        @packages_quantity = packages_quantity
      end

      def weight
        packages_quantity * UNIT_WEIGHT
      end

      def pallet_count
        full_pallets_count + overflow_pallets_count
      end

      private

      def full_pallets_count
        packages_quantity / PALLET_DIVISOR
      end

      def overflow_pallets_count
        overflow_packages? ? 1 : 0
      end

      def overflow_packages?
        (packages_quantity % PALLET_DIVISOR).positive?
      end

      attr_reader :packages_quantity
    end
  end
end

