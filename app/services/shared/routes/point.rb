module Shared
  module Routes
    class Point
      attr_reader :latitude, :longitude

      def initialize(latitude, longitude)
        @latitude = latitude
        @longitude = longitude
      end

      def ==(point)
        latitude == point.latitude &&
          longitude == point.longitude
      end
    end
  end
end

