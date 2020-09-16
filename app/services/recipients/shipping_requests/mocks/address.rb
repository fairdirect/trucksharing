module Recipients
  module ShippingRequests
    module Mocks
      Address = Struct.new(
        :gender, :company, :firstname, :name, :street, :house, :zip, :city, :country
      )
    end
  end
end
