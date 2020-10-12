require "securerandom"

FactoryBot.define do
  factory :country, class: "Marketplace::Country" do
    id { "DE" }
    name { "Deutschland" }
    phone { "049" }
  end
end
