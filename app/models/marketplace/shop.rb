module Marketplace
  class Shop < MarketplaceRecord
    self.table_name = "epelia_shops"

    belongs_to :user, class_name: "Marketplace::User"

    def address_to_s
      "#{country} #{city} #{street} #{house}"
    end
  end
end
