require_relative "point"

module Shared
  module Routes
    # Shared::Routes::Field class is describing a map-like abstract data structure in a rectangular shape.
    #
    # It deduces the corners of the field of available points in it.
    #
    # The use case for this is to know which shipping requests are
    # in the vicinity of the service provider's route by simplifying necessary
    # database calculations to using simple comparison operators, eg. "<" or ">".
    #
    # We are accomplishing that by having the boundaries for available coordinates
    # in the database and that of course reduces the available points to those
    # contained in this field.
    class Field
      def initialize(points)
        @points = points
      end

      def top_left_point
        build_point(latitude_max_point.latitude, longitude_min_point.longitude)
      end

      def top_right_point
        build_point(latitude_max_point.latitude, longitude_max_point.longitude)
      end

      def bottom_left_point
        build_point(latitude_min_point.latitude, longitude_min_point.longitude)
      end

      def bottom_right_point
        build_point(latitude_min_point.latitude, longitude_max_point.longitude)
      end

      private

      def latitude_max_point
        bottom_first.last
      end

      def latitude_min_point
        bottom_first.first
      end

      def longitude_max_point
        left_first.last
      end

      def longitude_min_point
        left_first.first
      end

      def left_first
        points.sort { |a, b| a.longitude <=> b.longitude }
      end

      def bottom_first
        points.sort { |a, b| a.latitude <=> b.latitude }
      end

      attr_reader :points

      def build_point(latitude, longitude)
        Routes::Point.new(latitude, longitude)
      end
    end
  end
end

