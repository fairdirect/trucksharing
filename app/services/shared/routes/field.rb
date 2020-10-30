module Shared
  module Routes
    class Field
      def initialize(point_1, point_2, point_3, point_4)
        @points = [point_1, point_2, point_3, point_4]
      end

      def top_left_point
        top_points[0]
      end

      def top_right_point
        top_points[1]
      end

      def bottom_left_point
        bottom_points[0]
      end

      def bottom_right_point
        bottom_points[1]
      end

      private

      def top_points
        top_first[0,2].sort { |a, b| a.longitude <=> b.longitude }
      end

      def bottom_points
        bottom_first[0,2].sort { |a, b| a.longitude <=> b.longitude }
      end

      def top_first
        bottom_first.reverse
      end

      def bottom_first
        points.sort { |a, b| a.latitude <=> b.latitude }
      end

      attr_reader :points
    end
  end
end

