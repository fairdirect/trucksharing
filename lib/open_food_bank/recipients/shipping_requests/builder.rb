require_relative "entity"
require_relative "cargo"
require_relative "weight"

module OpenFoodBank
  module Recipients
    module ShippingRequests
      class Builder
        def initialize(entity_class: Entity, cargo_class: Cargo, weight_class: Weight)
          @entity_class = entity_class
          @cargo_class = cargo_class
          @weight_class = weight_class
        end

        def build(resource)
          entity_class.new(
            id: resource.id,
            order_number: resource.order_number,
            status: resource.status,
            donation_date: resource.donation_date,
            cargo: build_cargo(resource.cargo),
            weight: build_weight(resource.weight),
          )
        end

        private

        attr_reader :entity_class, :cargo_class, :weight_class

        def build_cargo(cargo_hash)
          cargo_class.new(cargo_hash)
        end

        def build_weight(weight_hash)
          weight_class.new(weight_hash)
        end
      end
    end
  end
end
