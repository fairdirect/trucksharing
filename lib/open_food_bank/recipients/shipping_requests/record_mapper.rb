require 'forwardable'

module OpenFoodBank
  module Recipients
    module ShippingRequests
      class RecordMapper
        extend Forwardable
        def_delegators :@record, :id, :order_number, :status, :donation_date

        def initialize(record)
          @record = record
        end

        def weight
          {
            value: @record.cargo_weight,
            unit: @record.cargo_weight_unit
          }
        end

        def cargo
          {
            type: @record.cargo_type,
            quantity: @record.cargo_quantity,
            unit: @record.cargo_unit,
          }
        end
      end
    end
  end
end
