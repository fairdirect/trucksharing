module ServiceProviders
  module Routes
    class Service
      def initialize(routes_repo: Logistics::Route,
                     geocode_service: ::Shared::OpenStreetMap::Service.new)
        @routes_repo = routes_repo
        @geocode_service = geocode_service
      end

      def register_route(params)
        route_params = params
        route_params = Routes::ParamsMapper.new(params)
        departure_coordinates = geocode_service.find!(route_params.departure_address_text)
        destination_coordinates = geocode_service.find!(route_params.destination_address_text)
        # TODO:
        # 1. calculate the routes direction in radians `app/services/shared/routes/route.rb`
        # 2. get the path information from Graph Hopper: you can see it's usage in `app/services/recipients/shipping_requests/importer.rb`
        # 3. calculate the routes latitude/longitude maximum/minimum coordinates from an array of paths: `app/services/shared/routes/field.rb`

        routes_repo.create!(
          route_params.params_with_coordinates(departure_coordinates, destination_coordinates)
        )
      end

      private

      attr_reader :routes_repo, :geocode_service
    end
  end
end

