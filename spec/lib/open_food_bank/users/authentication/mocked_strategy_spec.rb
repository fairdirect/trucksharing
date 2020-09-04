require "spec_helper"
require "open_food_bank/users/authentication/mocked_strategy"

RSpec.describe "Mocked Authentication Strategy" do
  let(:strategy) { OpenFoodBank::Users::Authentication::MockedStrategy.new }

  describe "#authenticate" do
    subject { strategy.authenticate(token) }

    context "when no user has the provided token" do
      let(:token) { "e42f7bef-b85d-46d0-ae0c-2f2ab6d0ece8" }

      it { expect{subject}.to raise_error(OpenFoodBank::Users::Authentication::UnknownTokenError) }
    end

    context "when provided token matches a user" do
      let(:token) { "2e48afa0-ad6b-424b-b216-6ed41213d98a" }

      it "authenticates the user by his token" do
        user = subject
        expect(user.token).to eq(token)
      end
    end
  end
end
