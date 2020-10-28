require "rails_helper"

RSpec.describe "Schedule importing Orders as Shipping Requests", type: :request do
  describe "GET /api/v1/recipients/shipping_requests/schedule_import" do
    subject { post("/api/v1/recipients/shipping_requests/schedule_import", headers: headers) }
    let(:headers) { { "Authorisation" => token } }
    let(:token) { "2e48afa0-ad6b-424b-b216-6ed41213d98a" }
    let!(:recipient) { Marketplace::User.create_mocked_recipient }

    let(:expected_response) { { "shipping_requests_to_be_imported" => expected_count } }

    context "when there are no orders available for import" do
      let(:expected_count) { 0 }

      it "expects to enque an import job and return the number of expected imports" do
        expect(subject).to eq 200
        expect(JSON.parse(response.body)).to eq expected_response
      end
    end

    context "when there are some orders available for import" do
      let(:expected_count) { 1 }

      let!(:order_for_import) { FactoryBot.create(:order, user: recipient, created: 3.days.ago) }

      it "expects to enque an import job and return the number of expected imports" do
        expect { subject }.to have_enqueued_job
        expect(subject).to eq 200
        expect(JSON.parse(response.body)).to eq expected_response
      end
    end
  end
end
