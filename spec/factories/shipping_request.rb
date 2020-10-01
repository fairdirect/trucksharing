require "securerandom"

FactoryBot.define do
  factory :shipping_request, class: "Logistics::ShippingRequest" do
    order_number { SecureRandom.hex }
    donation_date { rand(1..14).days.ago }
    delivery_deadline { rand(1..14).days.since }

    delivery_city { "Berlin" }
    delivery_company_name { "Museum für Naturkunde" }
    delivery_country { "DE" }
    delivery_firstname { "First Name" }
    delivery_house { 43 }
    delivery_name { "Name" }
    delivery_street { "Invalidenstraße" }
    delivery_zip { "10115" }

    pickup_city { "Leipzig" }
    pickup_company_name { "McDonalds" }
    pickup_country { "DE" }
    pickup_firstname { "First Name" }
    pickup_house { "1" }
    pickup_name { "Name" }
    pickup_street { "Bruhl" }
    pickup_zip { "04109" }
  end
end
