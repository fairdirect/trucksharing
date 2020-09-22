module Recipients
  module ShippingRequests
    module Mocks
      class Shop
        def initialize(
          id, name, taxnumber, salestax_id,
          company, street, house, zip, city, phone, fax,
          register_id, register_court, office, representative,
          eco_control_board, eco_control_id, country
        )
          @id = id
          @name = name
          @taxnumber = taxnumber
          @salestax_id = salestax_id
          @company = company
          @street = street
          @house = house
          @zip = zip
          @city = city
          @phone = phone
          @fax = fax
          @register_id = register_id
          @register_court = register_court
          @office = office
          @representative = representative
          @eco_control_board = eco_control_board
          @eco_control_id = eco_control_id
          @country = country
        end

        attr_reader :id, :name, :taxnumber, :salestax_id,
                    :company, :street, :house, :zip, :city, :phone, :fax,
                    :register_id, :register_court, :office, :representative,
                    :eco_control_board, :eco_control_id, :country
      end
    end
  end
end
