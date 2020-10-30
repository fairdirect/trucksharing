require_relative "point"

module Shared
  module Routes
    class Route
      def initialize(departure_point, destination_point)
        @start_point = build_point(departure_point.latitude, departure_point.longitude)
        @end_point  = build_point(destination_point.latitude, destination_point.longitude)
      end

      def height
        end_point.latitude - start_point.latitude
      end

      def length
        end_point.longitude - start_point.longitude
      end

      def route_direction
        Math.atan2(height, length)
      end

      private

      attr_reader :start_point, :end_point

      def build_point(latitude, longitude)
        Routes::Point.new(latitude, longitude)
      end
    end
  end
end

