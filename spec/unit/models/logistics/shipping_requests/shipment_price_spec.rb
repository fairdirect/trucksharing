require "rails_helper"

RSpec.describe Logistics::ShippingRequests::ShipmentPrice do
  let(:shipment_price) { described_class.new(liters) }
  let(:liters) { 34 }
  let(:expected_price_dollars) { liters * 5 }
  let(:expected_price_cents) { expected_price_dollars * 100 }

  it { expect(shipment_price.amount_dollars).to eq expected_price_dollars }
  it { expect(shipment_price.amount_cents).to eq expected_price_cents }
end

