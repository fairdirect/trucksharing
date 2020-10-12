require "securerandom"

FactoryBot.define do
  factory :shop, class: "Marketplace::Shop" do
    user factory: :user
    name { Faker::Company.name }
    url { Faker::Internet.unique.url }
    company { Faker::Company.name }
    street { Faker::Address.street_name }
    house { Faker::Address.building_number }
    zip { Faker::Address.zip }
    city { Faker::Address.city }
    status { "new" }
  end
end
