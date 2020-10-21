module Logistics
  module ShippingRequests
    class MapPoint
      def initialize(latitude:, longitude:)
        @latitude = latitude
        @longitude = longitude
      end

      def to_a
        [latitude, longitude]
      end

      def to_params
        "#{latitude},#{longitude}"
      end

      attr_reader :latitude, :longitude
    end
  end
end

