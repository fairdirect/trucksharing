module Marketplace
  class Order < MarketplaceRecord
    DEFAULT_FROM_DAYS = 14.freeze

    self.table_name = "epelia_orders"

    belongs_to :user,             class_name: "Marketplace::User"
    belongs_to :shop,             class_name: "Marketplace::Shop"
    belongs_to :delivery_addr,    class_name: "Marketplace::Address"
    belongs_to :billing_addr,     class_name: "Marketplace::Address"
    has_one    :shipping_request, class_name: "Logistics::ShippingRequest", foreign_key: :epelia_order_id
  end
end
