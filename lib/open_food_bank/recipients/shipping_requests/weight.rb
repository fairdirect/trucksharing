module OpenFoodBank
  module Recipients
    module ShippingRequests
      class Weight
        def initialize(value:, unit:)
          @value = value
          @unit = unit
        end

        attr_reader :value, :unit

        def to_s
          "#{value} #{unit}"
        end
      end
    end
  end
end
