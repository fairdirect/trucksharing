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
    country { %w(DE AT CH BE DK FR LI LU NL PL US).sample }
    status { "new" }
  end
end
