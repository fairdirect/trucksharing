module Recipients
  module ShippingRequests
    class GraphHopperService
      EMPTY_COORDINATES = { "point" => { "lat" => -1, "lng" => -1} }.freeze

      def initialize(graph_hopper_client: GraphHopper.client)
        @graph_hopper_client = graph_hopper_client
      end

      def coordinates_for_text(text)
        result = graph_hopper_client.geocode(text)
        return EMPTY_COORDINATES if result.empty?
        result["hits"].first
      end

      private

      attr_reader :graph_hopper_client
    end
  end
end
