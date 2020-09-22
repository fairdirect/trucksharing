require "rails_helper"

RSpec.describe "Index of Recipient's Shipping Requests", type: :request do
  describe "GET /api/v1/recipients/shipping_requests" do
    subject { get('/api/v1/recipients/shipping_requests', headers: headers) }
    let(:headers) { { "Authorisation" => token } }
    let(:token) { "2e48afa0-ad6b-424b-b216-6ed41213d98a" }
    let(:expected_relationships) do
      {
        "delivery_addr"=>{
          "data"=>{
            "id"=>"1",
            "type"=>"delivery_address"
          }
        }
      }
    end
    let(:expected_response) do
      {
        "data" => [
          {
            "attributes"=>{
              "donation_date"=>"2020-09-08T12:00:05.000+00:00",
              "order_number"=>"26f0346684435c8d87955fe5",
              "status"=>"status",
              "weight"=>"6000 kg"
            },
            "id"=>"1",
            "relationships"=>expected_relationships,
            "type"=>"shipping_request"
          },
          {
            "attributes"=>{
              "donation_date"=>"2020-09-08T12:00:05.000+00:00",
              "order_number"=>"8bac9c9e975d8ddbcc0d9c1c",
              "status"=>"status",
              "weight"=>"6000 kg"
            },
            "id"=>"2",
            "relationships"=>expected_relationships,
            "type"=>"shipping_request"
          }
        ],
        "meta" => {
          "total"=>2
        }
      }
    end

    it "responses with a list of shipping requests following JSON:API standard" do
      expect(subject).to eq 200
      expect(JSON.parse(response.body)).to eq expected_response
    end
  end
end
