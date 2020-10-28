require "securerandom"

FactoryBot.define do
  factory :product_order, class: "Marketplace::ProductOrder" do
    product
    order
    quantity     { 5 }
    value        { 2000.0 }
    unit_type    { "pallet" }
    content_type { "kg" }
    contents     { 12 }
  end
end
