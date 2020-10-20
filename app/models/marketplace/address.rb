module Marketplace
  class Address < MarketplaceRecord
    self.table_name = "epelia_addresses"

    self.inheritance_column = nil

    belongs_to :user, class_name: "Marketplace::User"

    def to_s
      "#{country} #{city} #{street} #{house}"
    end
  end
end
