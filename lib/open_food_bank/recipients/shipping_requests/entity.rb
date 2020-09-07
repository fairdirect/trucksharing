module OpenFoodBank
  module Recipients
    module ShippingRequests
      class Entity
        def initialize(id:, order_number:, status:, donation_date:, cargo:, weight:)
          @id = id
          @order_number = order_number
          @status = status
          @donation_date = donation_date
          @cargo = cargo
          @weight = weight
        end

        attr_reader :id, :order_number, :status, :donation_date, :cargo, :weight
      end
    end
  end
end
