require "rails_helper"

RSpec.describe "Details of a Recipient's Shipping Request", type: :request do
  describe "GET /api/v1/recipients/shipping_requests" do
    subject { get("/api/v1/recipients/shipping_requests/#{requested_shipping_request_id}", headers: headers) }
    let(:headers) { { "Authorisation" => token } }
    let(:token) { "2e48afa0-ad6b-424b-b216-6ed41213d98a" }
    let(:shipping_request_id) { 1 }
    let(:expected_response) do
      {
        "data" => {
          "attributes"=>{
            "donation_date"=>"2020-09-08T12:00:05.000+00:00",
            "order_number"=>"26f0346684435c8d87955fe5",
            "status"=>"status",
            "weight"=>"6000 kg"
          },
          "id"=>"1",
          "relationships"=>{
            "delivery_addr"=>{
              "data"=>{
                "id"=>"1",
                "type"=>"delivery_address"
              }
            }
          },
          "type"=>"shipping_request"
        }
      }
    end

    context "when the shipping request exists for the recipitne" do
      let(:requested_shipping_request_id) { shipping_request_id }
      it "responses with a shipping request following JSON:API standard" do
        expect(subject).to eq 200
        expect(JSON.parse(response.body)).to eq expected_response
      end
    end

    context "when the shipping request does not exist for the recipient" do
      let(:requested_shipping_request_id) { 423 }
      it { expect(subject).to eq 404 }
    end
  end
end
