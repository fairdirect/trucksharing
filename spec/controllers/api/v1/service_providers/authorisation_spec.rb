require "rails_helper"

RSpec.describe "Recipient Authorisation", type: :request do
  describe "GET /api/v1/service_provider/authorised" do
    subject { get('/api/v1/service_provider/authorised', headers: headers) }
    let(:headers) { { "Authorisation" => token } }
    # IMPORTANT!
    # On thi stage of our development we are mocking user authorisation
    # so it will only accept a specific, mocked token.
    # It's purely for development's sake
    context "when authentication token matches a mocked recipient" do
      # Mocked token in lib/open_food_bank/users/authentication/mocked_user.rb
      # This will be changed to a real-life authentication strategy.
      let(:token) { "793cc4bd-99cc-4a54-9cdc-2fb2865ee90a" }

      it "returns user profile" do
        expect(subject).to eq 200
      end
    end

    context "when a user is not a recipient and cannot be authorised" do
      let(:token) { "2e48afa0-ad6b-424b-b216-6ed41213d98a" }

      it "returns Unauthorised status" do
        expect(subject).to eq 403
      end
    end
  end
end
