module Marketplace
  class Product < MarketplaceRecord
    self.table_name = "epelia_products"

    belongs_to :shop, class_name: "Marketplace::Shop"
  end
end
