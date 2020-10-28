require "rails_helper"

RSpec.describe Recipients::ShippingRequests::AttributesFactory do
  let(:factory) { described_class.new }

  describe "#build_from_order" do
    subject { factory.build_from_order(order, delivery_coordinates, pickup_coordinates, path) }

    let(:recipient) { FactoryBot.create(:user) }
    let(:order) { FactoryBot.create(:order, user: recipient, created: Time.zone.now) }
    let(:delivery_coordinates) { double(:coordinates, latitude: "12.2323", longitude: "12.333") }
    let(:pickup_coordinates) { double(:coordinates, latitude: "12.2323", longitude: "12.333") }
    let(:path) { double(:path, distance: 1234.23) }

    it "returns valid Shipping Request attributes" do
      expect(::Logistics::ShippingRequest.new(subject)).to be_valid
    end
  end
end

