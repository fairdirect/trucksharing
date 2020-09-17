require "rails_helper"

RSpec.describe "Enquiring Shipping", type: :request do
  describe "POST /api/v1/recipients/shipping_enquiries" do
    subject { post('/api/v1/recipients/shipping_enquiries', params: params, headers: headers) }
    let(:headers) { { "Authorisation" => token } }
    let(:token) { "2e48afa0-ad6b-424b-b216-6ed41213d98a" }
    let(:params) { { shipping_request_id: 1, service_provider_id: 2 } }

    it "responses with a shipping enquiry in JSON:API standard" do
      expect(subject).to eq 201
    end
  end
end
