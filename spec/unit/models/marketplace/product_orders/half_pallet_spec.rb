require "rails_helper"

RSpec.describe Marketplace::ProductOrders::HalfPallet do
  let(:pallet) { described_class.new(quantity) }
  let(:quantity) { 2 }

  it { expect(pallet.weight).to eq 240 }
  it { expect(pallet.pallet_count).to eq 1 }
end

