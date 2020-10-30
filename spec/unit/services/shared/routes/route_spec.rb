require "rails_helper"

RSpec.describe Shared::Routes::Route do
  let(:route) { described_class.new(departure_point, destination_point) }

  let(:departure_point) { Shared::Routes::Point.new(0, 0) }
  let(:destination_point) { Shared::Routes::Point.new(4, 4) }

  it { expect(route.height).to eq 4 }
  it { expect(route.length).to eq 4 }
  it { expect(route.route_direction).to eq Math::PI/4 }
end

