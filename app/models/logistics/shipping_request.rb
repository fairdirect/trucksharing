module Logistics
  class ShippingRequest < LogisticsRecord
    self.table_name = "logistics_shipping_requests"

    def self.last_import_date_for(user)
      where(user_id: user.id).order(donation_date: :desc).pluck(:donation_date).first
    end

    def status
      "pending"
    end

    def weight
      6000
    end
  end
end
