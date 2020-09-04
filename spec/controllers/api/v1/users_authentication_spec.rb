require "rails_helper"

RSpec.describe "Users Authentication", type: :request do
  describe "GET /api/v1/user/profile" do
    subject { get('/api/v1/user/profile', headers: headers) }
    let(:headers) { { "Authorisation" => token } }
    # IMPORTANT!
    # On thi stage of our development we are mocking user authentication
    # so it will only accept a specific, mocked token.
    # It's purely for development's sake
    context "when authentication token matches a mocked user" do
      # Mocked token in lib/open_food_bank/users/authentication/mocked_user.rb
      # This will be changed to a real-life authentication strategy.
      let(:token) { "2e48afa0-ad6b-424b-b216-6ed41213d98a" }

      it "returns user profile" do
        expect(subject).to eq 200
      end
    end

    context "when a user cannot be authenticated" do
      let(:token) { "6fe4c4fd-53fa-4e77-b47c-06662b27fac7" }

      it "returns Unauthorised status" do
        expect(subject).to eq 401
      end
    end
  end
end
