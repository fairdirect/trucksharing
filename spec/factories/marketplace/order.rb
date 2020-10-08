require "securerandom"

FactoryBot.define do
  factory :order, class: "Marketplace::Order" do
    association :user
    association :shop
    association :delivery_addr, factory: :address
    association :billing_addr, factory: :address

    order_number { SecureRandom.hex }
    status { "in_process" }
  end
end
