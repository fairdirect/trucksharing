module Recipients
  module ShippingRequests
    module OpenStreetMap
      class Response
        def initialize(raw_response)
          @raw_response = raw_response
        end

        def latitude
          raw_response["lat"]
        end

        def longitude
          raw_response["lng"]
        end

        private

        attr_reader :raw_response
      end
    end
  end
end

