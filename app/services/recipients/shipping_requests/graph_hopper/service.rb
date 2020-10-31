# TODO: If you will use it in a different user's domain, move it to module Shared
module Recipients
  module ShippingRequests
    module GraphHopper
      class RouteNotFound < StandardError; end

      class ApiError < StandardError
        def initialize(api_error_class)
          msg = "Api Client raised an exception: #{api_error_class}"
          super(msg)
        end
      end

      class Service
        def initialize(api_client: ::GraphHopper.client)
          @api_client = api_client
        end

        def route(coordinates_a, coordinates_b)
          raw_response = api_client.route(coordinates_a, coordinates_b)
          response = GraphHopper::Response.new(raw_response)
          raise RouteNotFound if response.empty?
          response
        rescue ::GraphHopper::ClientError => e
          raise ApiError.new(e.class)
        end

        private

        attr_reader :api_client
      end
    end
  end
end

