module Marketplace
  class ProductOrder < MarketplaceRecord
    self.table_name = "epelia_products_orders"

    belongs_to :user, class_name: "Marketplace::User"
  end
end
