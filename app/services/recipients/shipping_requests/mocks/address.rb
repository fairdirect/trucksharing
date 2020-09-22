module Recipients
  module ShippingRequests
    module Mocks
      Address = Struct.new(
        :id, :gender, :company, :firstname, :name, :street, :house, :zip, :city, :country
      )
    end
  end
end
