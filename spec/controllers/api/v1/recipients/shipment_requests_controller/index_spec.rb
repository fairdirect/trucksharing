require "rails_helper"

RSpec.describe "Index of Recipient's Shipping Requests", type: :request do
  describe "GET /api/v1/recipients/shipping_requests" do
    subject { get('/api/v1/recipients/shipping_requests', headers: headers) }
    let(:headers) { { "Authorisation" => token } }
    let(:token) { "2e48afa0-ad6b-424b-b216-6ed41213d98a" }
    let(:expected_response) { { "data" => [] } }

    it "responses with a list of shipping requests following JSON:API standard" do
      expect(subject).to eq 200
      expect(JSON.parse(response.body)).to eq expected_response
    end
  end
end
