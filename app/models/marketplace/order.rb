module Marketplace
  class User < MarketplaceRecord
    self.table_name = "epelia_orders"

    belongs_to :user, class_name: "Marketplace::User"
    belongs_to :shop, class_name: "Marketplace::Shop"
    belongs_to :delivery_addr, class_name: "Marketplace::Address"
    belongs_to :billing_addr, class_name: "Marketplace::Address"
  end
end
