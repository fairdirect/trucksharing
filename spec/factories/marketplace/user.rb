require "securerandom"

FactoryBot.define do
  factory :user, class: "Marketplace::User" do
    phpbb_id { rand(1..99) }
    email { Faker::Internet.email }
    password { SecureRandom.hex }
    salt { SecureRandom.hex }
    type { "customer" }
  end
end
