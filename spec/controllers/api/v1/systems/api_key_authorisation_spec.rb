require "rails_helper"

RSpec.describe "Api Key Authentication", type: :request do
  describe "GET /api/v1/systems/ping" do
    subject { get('/api/v1/system/ping', headers: headers) }
    let(:headers) { { "Api-Key" => token } }

    context "when api-key doesn't match any record" do
      let(:token) { "2e48afa0-ad6b-424b-b216-6ed41213d98a" }

      it { expect(subject).to eq 401 }
    end

    context "when api-key matches the an ApiKey record" do
      let!(:api_key_current) { FactoryBot.create(:api_key) }
      let(:token) { api_key_current.key }

      context "when it matches the current one" do
        it { expect(subject).to eq 200 }
      end

      context "when it matches the former one" do
        let!(:api_key_former) { FactoryBot.create(:api_key, deprecated_at: 2.days.since) }
        let(:token) { api_key_former.key }

        it { expect(subject).to eq 401 }
      end
    end
  end
end
