module Logistics
  module ShippingRequests
    class Address
      def initialize(city:, company:, country:, house:, street:, zip:, lat:, lng:)
        @company = company
        @country = country
        @city = city
        @house = house
        @street = street
        @zip = zip
        @map_point = ShippingRequests::MapPoint.new(latitude: lat, longitude: lng)
      end

      def coordinates_array
        map_point.to_a
      end

      def coordinates_params
        map_point.to_params
      end

      attr_reader :city, :company, :country, :house, :street, :zip, :map_point
    end
  end
end
