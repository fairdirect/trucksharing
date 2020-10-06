module Marketplace
  class Shop < MarketplaceRecord
    self.table_name = "epelia_shops"

    belongs_to :user, class_name: "Marketplace::User"
  end
end
