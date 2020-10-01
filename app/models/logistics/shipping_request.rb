module Logistics
  class ShippingRequest < LogisticsRecord
    self.table_name = "logistics_shipping_requests"

    def status
      "pending"
    end

    def weight
      6000
    end
  end
end
