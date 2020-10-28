FactoryBot.define do
  factory :product, class: "Marketplace::Product" do
    shop
    name { "Milk from Milk Co" }
    description { "Super milk from Awesome Cows" }
  end
end
