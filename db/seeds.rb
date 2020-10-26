require "securerandom"
require "digest"

country = Marketplace::Country.create!(id: "DE",
                                       name: "Germany",
                                       phone: "+49")

user = Marketplace::User..create_mocked_recipient

shop = Marketplace::Shop.create!(user_id: user.id,
                                 name: "Awesome Shop!",
                                 url: "shop@example.com",
                                 company: "Shopping Inc.",
                                 street: "Florapromenade",
                                 house: "22",
                                 zip: "3123",
                                 city: "Berlin",
                                 country: "DE",
                                 phone: "4324234243")

addr = Marketplace::Address.create!(user_id: user.id,
                                    street: "Gartenwinkel",
                                    company: "Awesome foundation",
                                    house: "36",
                                    city: "Leipzig",
                                    zip: "4289",
                                    country: "DE")

Marketplace::Order.create!(user_id: user.id,
                           shop_id: shop.id,
                           delivery_addr_id: addr.id,
                           billing_addr_id: addr.id,
                           status: "in_process",
                           order_number: SecureRandom.hex)

recipient = Marketplace::User.create_mocked_service_provider

