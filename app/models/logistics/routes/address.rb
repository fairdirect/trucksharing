module Logistics
  module ShippingRequests
    class Address
      def initialize(city:, country:, house:, street:, zip:, lat:, lng:)
        @country = country
        @city = city
        @house = house
        @street = street
        @zip = zip
        @map_point = ::Logistics::Shared::MapPoint.new(latitude: lat, longitude: lng)
      end

      def coordinates_array
        map_point.to_a
      end

      def coordinates_params
        map_point.to_params
      end

      attr_reader :city, :country, :house, :street, :zip, :map_point
    end
  end
end
