module Logistics
  class Route < LogisticsRecord
    self.table_name = "logistics_routes"

    belongs_to :user, class_name: "Marketplace::User"

    def departure_address
      build_address(departure_city, departure_country, departure_house,
                    departure_street, departure_zip, departure_lat, departure_lng)
    end

    def destination_address
      build_address(destination_city, destination_country, destination_house,
                    destination_street, destination_zip, destination_lat, destination_lng)
    end

    private

    def build_address(city, country, house, street, zip, lat, lng)
      Routes::Address.new(city: city, country: country,
                          house: house, street: street, zip: zip,
                          lat: lat, lng: lng)
    end
  end
end
