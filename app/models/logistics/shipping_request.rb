module Logistics
  class ShippingRequest < LogisticsRecord
    self.table_name = "logistics_shipping_requests"

    validates :donation_date, :delivery_deadline,
              :delivery_city, :delivery_company_name, :delivery_country, :delivery_house,
              :delivery_street, :delivery_zip, :delivery_lat, :delivery_lng,
              :pickup_city, :pickup_company_name, :pickup_country, :pickup_house,
              :pickup_street, :pickup_zip, :pickup_lat, :pickup_lng, presence: true
    validates :order_number, presence: true, uniqueness: true

    def self.last_import_date_for(user)
      where(user_id: user.id).order(donation_date: :desc).pluck(:donation_date).first
    end

    def delivery_address
      build_address(delivery_city, delivery_company_name, delivery_country, delivery_house,
                    delivery_street, delivery_zip, delivery_lat, delivery_lng)
    end

    def pickup_address
      build_address(pickup_city, pickup_company_name, pickup_country, pickup_house,
                    pickup_street, pickup_zip, pickup_lat, pickup_lng)
    end

    def status
      "pending"
    end

    def required_fuel
      ::Logistics::ShippingRequests::RequiredFuel.new(route_length_meters, cargo_weight)
    end

    def shipment_price
      ::Logistics::ShippingRequests::ShipmentPrice.new(required_fuel.liters)
    end

    private

    def build_address(city, company, country, house, street, zip, lat, lng)
      ShippingRequests::Address.new(city: city, company: company, country: country,
                                    house: house, street: street, zip: zip,
                                    lat: lat, lng: lng)
    end
  end
end
