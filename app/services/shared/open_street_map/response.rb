module Shared
  module OpenStreetMap
    class Response

      attr_reader :raw_response

      def initialize(raw_response)
        @raw_response = raw_response
      end

      def latitude
        raw_response["lat"]
      end

      def longitude
        raw_response["lon"]
      end

      def to_params
        "#{latitude},#{longitude}"
      end
    end
  end
end

