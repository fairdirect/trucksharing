module Logistics
  module ShippingRequests
    class Address
      def initialize(shipping_request_id:, city:, company:, country:, house:, street:, zip:)
        @shipping_request_id = shipping_request_id
        @company = company
        @country = country
        @city = city
        @house = house
        @street = street
        @zip = zip
      end

      attr_reader :shipping_request_id, :city, :company, :country, :house, :street, :zip
    end
  end
end
