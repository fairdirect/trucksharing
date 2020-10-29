module ServiceProviders
  module Routes
    class Address
      def initialize(city:, country:, house:, street:, zip:)
        @country = country
        @city = city
        @house = house
        @street = street
        @zip = zip
      end

      def address_to_s
        "#{country} #{city} #{street} #{house}"
      end

      attr_reader :city, :country, :house, :street, :zip
    end
  end
end
