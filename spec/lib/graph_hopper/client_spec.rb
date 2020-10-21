require "spec_helper"
require "graph_hopper/client"

RSpec.describe GraphHopper::Client do
  let(:client) { described_class.new(http_client) }
  let(:http_client) { double(:http_client) }

  describe "#geocode" do
    subject { client.geocode("Berlin") }

    let(:response_mock) { double(:http_ok, code: 200, body: response_body) }
    let(:response_body) { { "hits"=>[point], "locale" => "en" }.to_json }

    let(:point) do
      {
        "point"=>{ "lat"=>52.5170365, "lng"=>13.3888599 },
        "extent"=>[13.088345, 52.3382448, 13.7611609, 52.6755087],
        "name"=>"Berlin",
        "country"=>"Deutschland",
        "osm_id"=>62422,
        "osm_type"=>"R",
        "osm_key"=>"place",
        "osm_value"=>"state"
      }
    end

    before do
      allow(http_client).to receive(:get).and_return(response_mock)
    end

    it "returns a geocode data for the query" do
      expect(subject["hits"]).to eq [point]
      expect(subject.code).to eq 200
    end
  end

  describe "#route" do
    before do
      allow(http_client).to receive(:get_params_string).and_return(response_mock)
    end

    subject { client.route(point_a, point_b) }

    let(:point_a) { "51.39266055,12.335733447161886"}
    let(:point_b) { "52.563852,13.404648850000001" }

    context "when the api returns an OK response" do
      let(:response_mock) { double(:http_response, code: 200, body: response_body) }
      let(:response_body) { { "paths"=>[path] }.to_json }
      let(:path) { { "distance"=>181279.234 } }

      it "returns a geocode data for the query" do
        expect(subject["paths"]).to eq [path]
        expect(subject.code).to eq 200
      end
    end

    context "when the api returns a Bad Request response" do
      let(:response_mock) { double(:http_response, code: 400, body: nil) }

      it { expect { subject }.to raise_error(GraphHopper::BadRequest) }
    end

    context "when the api returns an Unauthorized response" do
      let(:response_mock) { double(:http_response, code: 401, body: nil) }

      it { expect { subject }.to raise_error(GraphHopper::Unauthorized) }
    end

    context "when the api returns an API Limit Reached response" do
      let(:response_mock) { double(:http_response, code: 429, body: nil) }

      it { expect { subject }.to raise_error(GraphHopper::ApiLimitReached) }
    end
  end
end
