require "rails_helper"

RSpec.describe Logistics::ShippingRequests::RequiredFuel do
  shared_examples "liters per 100 kilometer calculator" do |weight, expected_liters|
    let(:cargo_weight) { weight }

    it { expect(required_fuel.liters_per_100_kilometers).to eq expected_liters }
  end

  shared_examples "liters calculator" do |weight, route_length, expected_liters|
    let(:cargo_weight) { weight }
    let(:route_length_meters) { route_length }

    it { expect(required_fuel.liters).to eq expected_liters }
  end

  let(:required_fuel) { described_class.new(route_length_meters, cargo_weight) }
  let(:route_length_meters) { 1200 }

  context "when the cargo weight requires custom calculation" do
    it_behaves_like "liters per 100 kilometer calculator", 480, 7
    it_behaves_like "liters per 100 kilometer calculator", 980, 10
    it_behaves_like "liters per 100 kilometer calculator", 1280, 13
    it_behaves_like "liters per 100 kilometer calculator", 2304, 16
  end

  context "when the cargo weight can be calculated in a standarised way" do
    it_behaves_like "liters per 100 kilometer calculator", 3400, 18
    it_behaves_like "liters per 100 kilometer calculator", 4300, 19
    it_behaves_like "liters per 100 kilometer calculator", 5500, 20
  end

  it_behaves_like "liters calculator", 2304, 100_000, 16
  it_behaves_like "liters calculator", 2304, 200_000, 32
end

