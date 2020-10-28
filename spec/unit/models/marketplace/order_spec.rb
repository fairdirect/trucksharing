require "rails_helper"

RSpec.describe Marketplace::Order, type: :model do
  let(:order) { FactoryBot.create(:order) }

  it { expect(order).to be_valid }

  describe "#pallet_count" do
    subject { order.pallet_count }

    context "when no products are in an order" do

      it { expect(subject).to eq 0 }
    end

    context "when the order has some products" do
      before do
        FactoryBot.create(:product_order, order: order, unit_type: "pallet", quantity: 1)
        FactoryBot.create(:product_order, order: order, unit_type: "half_pallet", quantity: 2)
      end

      it { expect(subject).to eq 2 }
    end
  end
end

