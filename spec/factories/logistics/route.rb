
FactoryBot.define do
  factory :route, class: "Logistics::Route" do
    user factory: :service_provider
    departing_at { 2.days.since }

    departure_city { "Berlin" }
    departure_country { "DE" }
    departure_house { 14 }
    departure_street { "Ernst-Barlach-Straße" }
    departure_zip { "13059" }
    departure_lat { "52.57577" }
    departure_lng { "13.51105" }
    destination_city { "Leipzig" }
    destination_country { "DE" }
    destination_house { 45 }
    destination_street { "Coppistraße" }
    destination_zip { "04157" }
    destination_lat { "51.36650" }
    destination_lng { "12.37722" }
  end
end

