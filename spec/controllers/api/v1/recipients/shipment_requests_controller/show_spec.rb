require "rails_helper"

RSpec.describe "Details of a Recipient's Shipping Request", type: :request do
  describe "GET /api/v1/recipients/shipping_requests" do
    subject { get("/api/v1/recipients/shipping_requests/#{requested_shipping_request_id}", headers: headers) }
    let(:headers) { { "Authorisation" => token } }
    let(:token) { "2e48afa0-ad6b-424b-b216-6ed41213d98a" }
    let!(:recipient) { Marketplace::User.create_mocked_recipient }
    let!(:shipping_request) do
      FactoryBot.create(:shipping_request, user_id: recipient.id)
    end

    let(:shipping_request_id) { 1 }
    let(:expected_response) do
      {
        "data" => {
          "attributes" => {
            "delivery_city"=>         shipping_request.delivery_city,
            "delivery_company_name"=> shipping_request.delivery_company_name,
            "delivery_country"=>      shipping_request.delivery_country,
            "delivery_house"=>        shipping_request.delivery_house,
            "delivery_street"=>       shipping_request.delivery_street,
            "delivery_zip"=>          shipping_request.delivery_zip,
            "pickup_city"=>           shipping_request.pickup_city,
            "pickup_company_name"=>   shipping_request.pickup_company_name,
            "pickup_country"=>        shipping_request.pickup_country,
            "pickup_house"=>          shipping_request.pickup_house,
            "pickup_street"=>         shipping_request.pickup_street,
            "pickup_zip"=>            shipping_request.pickup_zip,
            "donation_date"=>         shipping_request.donation_date.to_date.to_s(:db),
            "delivery_deadline"=>     shipping_request.delivery_deadline.to_date.to_s(:db),
            "order_number"=>          shipping_request.order_number,
            "status"=>                shipping_request.status,
            "weight"=>                "#{shipping_request.weight} kg"
          },
          "id"=>shipping_request.id.to_s,
          "type"=>"shipping_request",
          "links"=>{"public_url"=>"/api/v1/recipients/shipping_requests/#{requested_shipping_request_id}"}
        }
      }
    end

    context "when the shipping request exists for the recipitne" do
      let(:requested_shipping_request_id) { shipping_request.id }
      it "responses with a shipping request following JSON:API standard" do
        expect(subject).to eq 200
        expect(JSON.parse(response.body)).to eq expected_response
      end
    end

    context "when the shipping request does not exist for the recipient" do
      let(:requested_shipping_request_id) { -1 }
      it { expect(subject).to eq 404 }
    end
  end
end
