require "rails_helper"

RSpec.describe "Index of Recipient's Shipping Requests", type: :request do
  describe "GET /api/v1/recipients/shipping_requests" do
    subject { get('/api/v1/recipients/shipping_requests', headers: headers) }
    let(:headers) { { "Authorisation" => token } }
    let(:token) { "2e48afa0-ad6b-424b-b216-6ed41213d98a" }
    let(:expected_response) do
      {
        "data"=>[
          {
            "attributes" => {
              "cargo_type"=>"solid",
              "cargo_volume"=>"4 palletes",
              "donation_date"=>"2020-09-08T12:00:05.000+00:00",
              "id"=>1,
              "order_number"=>"BCDSE",
              "status"=>"in_process",
              "weight"=>"1280 kg"
            },
            "id"=>"1",
            "type"=>"shipping_request"
          },
          {
            "attributes" => {
              "cargo_type"=>"liquid",
              "cargo_volume"=>"6 palletes",
              "donation_date"=>"2020-09-08T12:00:10.000+00:00",
              "id"=>2,
              "order_number"=>"TREDF",
              "status"=>"in_process",
              "weight"=>"2030 kg"
            },
            "id"=>"2",
            "type"=>"shipping_request"
          }
        ],
        "meta" => {
          "total" => 2
        }
      }
    end

    it "responses with a list of shipping requests following JSON:API standard" do
      expect(subject).to eq 200
      expect(JSON.parse(response.body)).to eq expected_response
    end
  end
end
