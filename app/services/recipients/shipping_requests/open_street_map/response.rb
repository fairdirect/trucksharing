module Recipients
  module ShippingRequests
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
      end
    end
  end
end

