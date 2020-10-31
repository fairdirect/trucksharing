require "rails_helper"

RSpec.describe Shared::Routes::Field do
  let(:field) { described_class.new(points) }
  let(:points) do
    [point_1, point_2, point_3, point_4] + inner_points
  end

  let(:lat_min) { 1 }
  let(:lat_max) { 6 }
  let(:lng_min) { 1 }
  let(:lng_max) { 4 }
  let(:lat_range) { lat_min..lat_max }
  let(:lng_range) { lng_min..lng_max }

  let(:top_left_point) { Shared::Routes::Point.new(lat_max, lng_min) }
  let(:top_right_point) { Shared::Routes::Point.new(lat_max, lng_max) } # (6, 4)
  let(:bottom_left_point) { Shared::Routes::Point.new(lat_min, lng_min) } # (1, 1)
  let(:bottom_right_point) { Shared::Routes::Point.new(lng_min, lng_max) } # (4, 4)

  let(:point_1) { Shared::Routes::Point.new(lat_max, rand(lng_range)) }
  let(:point_2) { Shared::Routes::Point.new(rand(lat_range), lng_max) }
  let(:point_3) { Shared::Routes::Point.new(lat_min, rand(lng_range)) }
  let(:point_4) { Shared::Routes::Point.new(rand(lat_range), lng_min) }
  let(:inner_points) do
    10.times.map { |i| Shared::Routes::Point.new(rand(lat_range), rand(lng_range)) }
  end

  it { expect(field.top_left_point).to eq top_left_point }
  it { expect(field.top_right_point).to eq top_right_point }
  it { expect(field.bottom_left_point).to eq bottom_left_point }
  it { expect(field.bottom_right_point).to eq bottom_right_point }
end

