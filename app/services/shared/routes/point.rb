module Shared
  module Routes
    class Point
      attr_reader :latitude, :longitude

      def initialize(latitude, longitude)
        @latitude = latitude
        @longitude = longitude
      end
    end
  end
end

