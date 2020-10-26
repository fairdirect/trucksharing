require "rails_helper"

RSpec.describe "Api Key Authentication", type: :request do
  describe "get /api/v1/import_order/:order_number" do
    subject { get("/api/v1/import_order/#{order_number}", headers: headers) }
    let(:headers) { { "Api-Key" => token } }
    let!(:api_key_current) { FactoryBot.create(:api_key) }
    let(:token) { api_key_current.key }

    context "when there is no order with the provided number" do
      let(:order_number) { "invalid_order_number" }

      it { expect(subject).to eq 404 }
    end

    context "when there is an order with the provided number" do
      before do
        allow_any_instance_of(::Recipients::ShippingRequests::Importer).to receive(:import_for_order_number).with(order).and_return(imported_shipping_request)
      end
      let(:recipient) { FactoryBot.create(:user) }
      let!(:imported_shipping_request) { FactoryBot.create(:shipping_request, user_id: recipient.id, order_number: order_number) }
      let(:order_number) { order.order_number }
      let!(:order) do
        country = FactoryBot.create(:country)
        delivery_addr = FactoryBot.create(:address, user: recipient, country: country.id)
        billing_addr = FactoryBot.create(:address, user: recipient, country: country.id)
        shop = FactoryBot.create(:shop, user: recipient, country: country.id)
        FactoryBot.create(:order,
                         user: recipient,
                         created: 2.days.since,
                         delivery_addr: delivery_addr,
                         billing_addr: billing_addr,
                         shop: shop)
      end

      it "returns the imported shipping request for confirmation" do
        expect(subject).to eq 200
        response_body = JSON.parse(response.body)
        expect(response_body["order_number"]).to eq imported_shipping_request.order_number
      end
    end
  end
end

