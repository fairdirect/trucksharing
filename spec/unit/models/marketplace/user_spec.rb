require "rails_helper"

RSpec.describe Marketplace::User, type: :model do
  describe ".find_by_token!" do
    subject { described_class.find_by_token!(token) }

    context "when the token points to nobody" do
      let(:token) { "wrong_token" }

      it { expect { subject }.to raise_error(ActiveRecord::RecordNotFound) }
    end

    context "when the token points to a recipient" do
      let(:token) { described_class::MOCKED_RECIPIENT_TOKEN }

      it { expect(subject.type).to eq described_class::RECIPIENT_ROLE_NAME }
    end

    context "when the token points to a service provider" do
      let(:token) { described_class::MOCKED_SERVICE_PROVIDER_TOKEN }

      it { expect(subject.type).to eq described_class::SERVICE_PROVIDER_ROLE_NAME }
    end

    context "when we ask for the same user twice" do
      let(:token) { described_class::MOCKED_RECIPIENT_TOKEN }
      let!(:user) { described_class.find_by_token!(token) }

      it { expect(subject).to eq user }
    end
  end
end

