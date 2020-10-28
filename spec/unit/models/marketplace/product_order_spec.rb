require "rails_helper"

RSpec.describe Marketplace::ProductOrder, type: :model do
  let(:product_order) { FactoryBot.build(:product_order, options) }
  let(:options) { { } }

  it { expect(product_order).to be_valid }

  describe "#pallet_type" do
    let(:options) { { unit_type: "pallet", quantity: 2 } }

    subject { product_order.pallet_type }

    it "returns a value object for packaging" do
      packaging = subject
      expect(packaging.weight).to eq 600
      expect(packaging.pallet_count).to eq 2
    end
  end
end

