require "rails_helper"

RSpec.describe Recipients::ShippingRequests::Importer do
  let(:importer) do
    described_class.new(order_scope: order_scope, shipping_request_repo: shipping_request_repo)
  end

  let(:order_scope) { ::Marketplace::Order }
  let(:shipping_request_repo) { ::Logistics::ShippingRequest }

  let(:recipient) do
    FactoryBot.create(:user)
  end

  describe "#import" do
    subject { importer.import(recipient) }

    let!(:order_for_import) do
      delivery_addr = FactoryBot.create(:address, user: recipient)
      billing_addr = FactoryBot.create(:address, user: recipient)
      shop = FactoryBot.create(:shop, user: recipient)
      FactoryBot.build(:order,
                       user: recipient,
                       created: order_placement_date,
                       delivery_addr: delivery_addr,
                       billing_addr: billing_addr,
                       shop: shop).save!
    end

    context "when there are orders to import but are overdo" do
      let(:order_placement_date) { 17.days.ago }

      it "imports the available orders" do
        expect(subject).to eq 0
      end
    end

    context "when the orders were already imported" do
      let(:order_placement_date) { 3.days.ago }

      before do
        importer.import(recipient)
      end

      it "imports the available orders" do
        expect(subject).to eq 0
      end
    end

    context "when there are orders to import" do
      let(:order_placement_date) { 3.days.ago }

      it "imports the available orders" do
        expect(subject).to eq 1
      end
    end
  end
end

