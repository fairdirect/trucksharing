module Recipients
  module ShippingRequests
    module OpenStreetMap
      class GeocodeNotFound < StandardError; end

      class Service
        def initialize(api_client: ::OpenStreetMap::Client.new)
          @api_client = api_client
        end

        def search(query_text)
          raw_search(query_text).map { |response_item| Response.new(response_item) }
        end

        def find!(query_text)
          response_items = search(query_text)
          raise GeocodeNotFound if response_items.empty?

          response_items.first
        end

        private

        attr_reader :api_client

        def raw_search(query_text)
          api_client.search(q: query_text, format: "json", addressdetails: "1")
        end
      end
    end
  end
end
