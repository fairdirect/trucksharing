require "rails_helper"

RSpec.describe Marketplace::ProductOrders::PackagePallet do
  let(:pallet) { described_class.new(quantity) }
  let(:quantity) { 43 }

  it { expect(pallet.weight).to eq 860 }
  it { expect(pallet.pallet_count).to eq 3 }
end

