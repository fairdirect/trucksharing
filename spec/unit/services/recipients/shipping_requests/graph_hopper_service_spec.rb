require "mocks/graph_hopper_client"
require "rails_helper"

RSpec.describe Recipients::ShippingRequests::GraphHopperService do
  let(:service) { described_class.new(graph_hopper_client: graph_hopper_client) }
  let(:graph_hopper_client) { Mocks::GraphHopperClient.new }

  describe "#coordinates_for_text" do
    subject { service.coordinates_for_text(text) }

    context "when the point was found" do
      let(:text) { "Germany Munchen Ernst-Schneider-Weg 9" }
      let(:expected_point) { { lat:  48.2113654, lng: 11.5848575 } }

      it { expect(subject[:point]).to eq(expected_point) }
    end

    context "when the point wasn't found" do
      let(:text) { "Gemerey Mfsdaflhen E-Wegousdafs 213sdfa" }
      let(:expected_point) { { lat:  -1, lng: -1 } }

      it { expect(subject[:point]).to eq(expected_point) }
    end
  end
end

