module Recipients
  module ShippingRequests
    module Mocks
      class Address
        def initialize(id, gender, company, firstname, name, street, house, zip, city, country)
          @id = id
          @gender = gender
          @company = company
          @firstname = firstname
          @name = name
          @street = street
          @house = house
          @zip = zip
          @city = city
          @country = country
        end

        attr_reader :id, :gender, :company, :firstname, :name, :street, :house, :zip, :city, :country
      end
    end
  end
end
