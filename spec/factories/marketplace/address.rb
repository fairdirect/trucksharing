require "securerandom"

FactoryBot.define do
  factory :address, class: "Marketplace::Address" do
    company { Faker::Company.name }
    street { Faker::Address.street_name }
    house { Faker::Address.building_number }
    zip { Faker::Address.zip }
    city { Faker::Address.city }
  end
end
