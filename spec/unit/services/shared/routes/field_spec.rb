require "rails_helper"

RSpec.describe Shared::Routes::Field do
  let(:field) { described_class.new(point_1, point_2, point_3, point_4) }

  let(:point_1) { Shared::Routes::Point.new(6, 1) }
  let(:point_2) { Shared::Routes::Point.new(1, 1) }
  let(:point_3) { Shared::Routes::Point.new(6, 4) }
  let(:point_4) { Shared::Routes::Point.new(1, 4) }

  it { expect(field.top_left_point).to eq point_1 }
  it { expect(field.top_right_point).to eq point_3 }
  it { expect(field.bottom_left_point).to eq point_2 }
  it { expect(field.bottom_right_point).to eq point_4 }
end

