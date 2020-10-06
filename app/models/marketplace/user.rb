module Marketplace
  class User < MarketplaceRecord
    self.table_name = "epelia_users"

    self.inheritance_column = nil
  end
end
