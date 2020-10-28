module Logistics
  module ShippingRequests
    class RequiredFuel
      STANDARD_CALCULATION_MIN_WEIGHT = 3000.freeze
      LOWEST_STANDARD_CALCULATION_LITERS = 18.freeze
      CUSTOM_CALCULATION_TABLE = [
        { max_weight: 500,  liters: 7  },
        { max_weight: 1000, liters: 10 },
        { max_weight: 2000, liters: 13 },
        { max_weight: 3000, liters: 16 }
      ].freeze

      def initialize(route_length_meters, cargo_weight)
        @route_length_meters = route_length_meters
        @cargo_weight = cargo_weight
      end

      def liters
        liters_per_100_kilometers * route_length_kilometers / 100
      end

      def liters_per_100_kilometers
        if cargo_weight > STANDARD_CALCULATION_MIN_WEIGHT
          standard_liters_per_100_kilometers
        else
          custom_liters_per_100_kilometers
        end
      end

      private

      def standard_liters_per_100_kilometers
        LOWEST_STANDARD_CALCULATION_LITERS + additional_liters_per_100_kilometers
      end

      def additional_liters_per_100_kilometers
        (cargo_weight / 1000).to_i - 3
      end

      def custom_liters_per_100_kilometers
        CUSTOM_CALCULATION_TABLE.find { |entry| entry[:max_weight] >= cargo_weight }[:liters]
      end

      def route_length_kilometers
        (route_length_meters / 1000).to_i
      end

      attr_reader :route_length_meters, :cargo_weight
    end
  end
end

