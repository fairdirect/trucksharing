module Recipients
  module ShippingRequests
    module Mocks
      Shop = Struct.new(
        :id, :name, :taxnumber, :salestax_id,
        :company, :street, :house, :zip, :city, :phone, :fax,
        :register_id, :register_court, :office, :representative,
        :eco_control_board, :eco_control_id, :country
      )
    end
  end
end
