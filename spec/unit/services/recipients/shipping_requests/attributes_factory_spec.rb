require "rails_helper"

RSpec.describe Recipients::ShippingRequests::AttributesFactory do
  let(:factory) { described_class.new }

  describe "#build_from_order" do
    subject { factory.build_from_order(order) }

    let(:recipient) { FactoryBot.create(:user) }
    let(:order) do
      country = FactoryBot.create(:country)
      delivery_addr = FactoryBot.create(:address, user: recipient, country: country.id)
      billing_addr = FactoryBot.create(:address, user: recipient, country: country.id)
      shop = FactoryBot.create(:shop, user: recipient, country: country.id)
      FactoryBot.create(:order,
                       user: recipient,
                       created: Time.zone.now,
                       delivery_addr: delivery_addr,
                       billing_addr: billing_addr,
                       shop: shop)
    end

    it "returns valid Shipping Request attributes" do
      expect(::Logistics::ShippingRequest.new(subject)).to be_valid
    end
  end
end

