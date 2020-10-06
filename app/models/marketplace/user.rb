module Marketplace
  class User < MarketplaceRecord
    self.table_name = "epelia_users"

    self.inheritance_column = nil

    has_many :orders, class_name: 'Marketplace::Order'
    has_many :shops, class_name: 'Marketplace::Shop'
    has_many :adresses, class_name: 'Marketplace::Address'
  end
end
