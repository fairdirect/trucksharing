module ServiceProviders
  module Routes
    class ParamsMapper
      def initialize(raw_params)
        @raw_params = raw_params
        @departure_address = build_departure_address
        @destination_address = build_destination_address
      end

      def params_with_coordinates(departure_coordinates, destination_coordinates)
        raw_params.merge(
          departure_lat: departure_coordinates.latitude,
          departure_lng: departure_coordinates.longitude,
          destination_lat: destination_coordinates.latitude,
          destination_lng: destination_coordinates.longitude
        )
      end

      def departure_address_text
        departure_address.to_s
      end

      def destination_address_text
        destination_address.to_s
      end

      private

      attr_reader :raw_params, :departure_address, :destination_address

      def build_destination_address
        build_address(raw_params[:destination_city], raw_params[:destination_country],
                      raw_params[:destination_house], raw_params[:destination_street],
                      raw_params[:destination_zip])
      end

      def build_departure_address
        build_address(raw_params[:departure_city], raw_params[:departure_country],
                      raw_params[:departure_house], raw_params[:departure_street],
                      raw_params[:departure_zip])
      end

      def build_address(city, country, house, street, zip)
        Routes::Address.new(city: city, country: country, house: house, street: street, zip: zip)
      end
    end
  end
end

