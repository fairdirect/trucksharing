module Recipients
  module ShippingRequests
    module Mocks
      Product = Struct.new(:id, :quantity, :unit_type,
                           :content_type, :contents, :name) do
        UNIT_WEIGHT = {
          pallet: 300,
          half_pallet: 120,
          package: 10
        }

        def weight
          unit_weight * quantity
        end

        def unit_weight
          UNIT_WEIGHT[unit_type.to_sym]
        end
      end
    end
  end
end
