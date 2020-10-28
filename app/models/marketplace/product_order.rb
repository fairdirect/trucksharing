module Marketplace
  class ProductOrder < MarketplaceRecord
    PALLET_TYPE = {
      "pallet" => Marketplace::ProductOrders::Pallet,
      "half_pallet" => Marketplace::ProductOrders::HalfPallet,
      "package" => Marketplace::ProductOrders::PackagePallet,
    }
    self.table_name = "epelia_products_orders"

    belongs_to :order, class_name: "Marketplace::Order"
    belongs_to :product, class_name: "Marketplace::Product"

    def pallet_type
      PALLET_TYPE[unit_type].new(quantity)
    end

    def weight
      pallet_type.weight
    end

    def pallet_count
      pallet_type.pallet_count
    end
  end
end
