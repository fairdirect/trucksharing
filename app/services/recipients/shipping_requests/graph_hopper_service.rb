module Recipients
  module ShippingRequests
    class GraphHopperService
      EMPTY_COORDINATES = { point: { lat: -1, lng: -1} }.freeze

      def initialize(graph_hopper_client:)
        @graph_hopper_client = graph_hopper_client
      end

      def coordinates_for_text(text)
        result = graph_hopper_client.find_geocode(text)
        return EMPTY_COORDINATES if result.nil?
        result
      end

      private

      attr_reader :graph_hopper_client
    end
  end
end
