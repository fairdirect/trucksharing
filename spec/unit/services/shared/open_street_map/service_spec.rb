require "rails_helper"

RSpec.describe Shared::OpenStreetMap::Service do
  let(:service) { described_class.new(api_client: api_client) }
  let(:api_client) { double(:api_client, search: search_result) }
  let(:search_result) { [hit] }
  let(:hit) { { "lat" => "32.324", "lon" => "12.234" } }

  describe "#search" do
    subject { service.search("address text") }

    it "returns hits for the given text" do
      result = subject.first
      expect(result.latitude).to eq hit["lat"]
      expect(result.longitude).to eq hit["lon"]
    end
  end

  describe "#find!" do
    subject { service.find!("address text") }

    it "returns hits for the given text" do
      result = subject
      expect(result.latitude).to eq hit["lat"]
      expect(result.longitude).to eq hit["lon"]
    end
  end
end

