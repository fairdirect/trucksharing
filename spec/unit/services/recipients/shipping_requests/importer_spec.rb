require "rails_helper"

RSpec.describe Recipients::ShippingRequests::Importer do
  let(:importer) do
    described_class.new(order_scope: order_scope, repository: shipping_request_repo)
  end

  let(:order_scope) { ::Marketplace::Order }
  let(:shipping_request_repo) { ::Logistics::ShippingRequest }
  let(:recipient) { FactoryBot.create(:user) }

  describe "#import" do
    subject { importer.import(recipient) }

    let!(:order_for_import) do
      country = FactoryBot.create(:country)
      delivery_addr = FactoryBot.create(:address, user: recipient, country: country.id)
      billing_addr = FactoryBot.create(:address, user: recipient, country: country.id)
      shop = FactoryBot.create(:shop, user: recipient, country: country.id)
      FactoryBot.create(:order,
                       user: recipient,
                       created: order_placement_date,
                       delivery_addr: delivery_addr,
                       billing_addr: billing_addr,
                       shop: shop)
    end

    context "when there are orders to import but are overdo" do
      let(:order_placement_date) { 17.days.ago }

      it "won't import them" do
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

