require "rails_helper"

RSpec.describe "Enquiring Shipping", type: :request do
  describe "POST /api/v1/recipients/shipping_enquiries" do
    subject { post('/api/v1/recipients/shipping_enquiries', params: params, headers: headers) }
    let(:headers) { { "Authorisation" => token } }
    let(:token) { "2e48afa0-ad6b-424b-b216-6ed41213d98a" }

    context "when params represent a valid enquiry" do
      let(:shipping_request) { FactoryBot.create(:shipping_request, user_id: 1) }
      let(:params) { { shipping_enquiry: { shipping_request_id: shipping_request.id, service_provider_id: 2 } } }

      it "responses with a shipping enquiry in JSON:API standard" do
        expect(subject).to eq 201
        response_obj = JSON.parse(response.body)
        expect(response_obj["data"]["id"].to_i).to eq Logistics::ShippingEnquiry.last.id
      end
    end

    context "when params are missing any of the required attributes" do
      let(:params) { { shipping_enquiry: { service_provider_id: 2 } } }

      it { expect(subject).to eq 400 }
    end

    context "when params point to objects that do not exist" do
      let(:params) { { shipping_enquiry: { shipping_request_id: -1, service_provider_id: 2 } } }

      it { expect(subject).to eq 404 }
    end
  end
end

