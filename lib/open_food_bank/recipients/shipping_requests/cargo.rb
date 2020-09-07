module OpenFoodBank
  module Recipients
    module ShippingRequests
      class Cargo
        def initialize(type:, quantity:, unit:)
          @type = type
          @quantity = quantity
          @unit = unit
        end

        attr_reader :type, :quantity, :unit

        def volume
          "#{quantity} #{unit}#{quantity > 1 ? "s" : ""}"
        end
      end
    end
  end
end

