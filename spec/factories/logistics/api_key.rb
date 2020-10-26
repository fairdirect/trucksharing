require "securerandom"

FactoryBot.define do
  factory :api_key, class: "Logistics::ApiKey" do
    key { SecureRandom.uuid }
  end
end

