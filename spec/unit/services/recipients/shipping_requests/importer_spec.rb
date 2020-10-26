require "rails_helper"

RSpec.describe Recipients::ShippingRequests::Importer do
  let(:importer) do
    described_class.new(
      order_scope: order_scope,
      repository: shipping_request_repo,
      geocode_service: geocode_service,
      route_service: route_service
    )
  end

  let(:order_scope) { ::Marketplace::Order }
  let(:shipping_request_repo) { ::Logistics::ShippingRequest }
  let(:recipient) { FactoryBot.create(:user) }
  let(:geocode_service) { double(:geocode_service, find!: geocode_service_response) }
  let(:geocode_service_response) do
    double(:response, latitude: "43.123", longitude: "13.333", to_params: "43.123,13.333")
  end
  let(:route_service) { double(:route_service, route: route_service_response) }
  let(:route_service_response) { double(:paths, paths: [path], top_path: path) }
  let(:path) { double(:path, distance: 1234.23423) }
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

  describe "#import_for_order_number" do
    subject { importer.import_for_order_number(order_for_import) }

    let(:order_placement_date) { 3.days.ago }

    it "imports the available orders" do
      expect(subject.order_number).to eq order_for_import.order_number
    end
  end

  describe "#import" do
    subject { importer.import(recipient) }

    context "when there are orders to import but are overdo" do
      let(:order_placement_date) { 17.days.ago }

      it "won't import them" do
        expect(subject.count).to eq 0
      end
    end

    context "when the orders were already imported" do
      let(:order_placement_date) { 3.days.ago }

      before do
        importer.import(recipient)
      end

      it "imports the available orders" do
        expect(subject.count).to eq 0
      end
    end

    context "when there are orders to import" do
      let(:order_placement_date) { 3.days.ago }

      it "imports the available orders" do
        expect(subject.count).to eq 1
      end
    end
  end
end

